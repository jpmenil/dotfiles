#!/usr/bin/env python3

import sys
from pathlib import Path

import boto3

ssh_conf = f"{Path.home()}/.ssh/config"
ssh_conf_dir = f"{Path.home()}/.ssh/config.d"

template = """
Host {}.{}
     HostName {}
     IdentityFile ~/.ssh/id_ed25519
     User ec2-user
     ProxyCommand ~/bin/aws-ssm-ec2-proxy-command.sh %h %r %p ~/.ssh/id_ed25519.pub
     StrictHostKeyChecking no
"""


def check_config():
    include = "Include config.d/*"
    with open(ssh_conf, "r") as original:
        data = original.read()
    if include not in data:
        with open(ssh_conf, "w") as modified:
            modified.write("{0}\n".format(include) + data)


def construct_hosts(response):
    hosts = {}
    for reservation in response["Reservations"]:
        for instance in reservation["Instances"]:
            if instance.get('State')['Name'] == 'running':
                instance_id = instance["InstanceId"]
                if "Tags" in instance:
                    for tags in instance["Tags"]:
                        if tags.get("Key") == "product":
                            product = tags.get("Value")
                            hosts[product] = hosts.get(product, [])
                            if instance_id not in hosts[product]:
                                hosts[product].append(instance_id)
    return hosts


def construct_ssh(hosts, profile):
    if not Path(ssh_conf_dir).is_dir():
        Path(ssh_conf_dir).mkdir()
    ssh_file = f"{ssh_conf_dir}/work.{profile}"
    if Path(ssh_file).is_file():
        Path(ssh_file).unlink()

    with open(ssh_file, "a") as f:
        for project, instances in hosts.items():
            for index, instance in enumerate(instances):
                f.write(template.format(f"{project}-{index}", profile, instance))


if __name__ == "__main__":
    if len(sys.argv) <= 1:
        print("pass profile name")
        sys.exit(1)

    profile = sys.argv[1]
    # session = boto3.Session(profile_name=profile)
    client = boto3.client("ec2")
    response = client.describe_instances()
    check_config()
    hosts = construct_hosts(response)
    construct_ssh(hosts, profile)
