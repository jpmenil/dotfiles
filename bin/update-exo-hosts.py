#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import git
import os
import re

home = os.path.expanduser('~/')

git_dir = home + 'WORK/exoscale/GIT/dns-zones'
zone = git_dir + '/p.exoscale.net'

ssh_conf = home + '.ssh/config'
ssh_conf_dir = home + '.ssh/config.d/'
exo_file = ssh_conf_dir + 'exo-hosts'
include = 'Include config.d/*'

zones = ['aws', 'dk2', 'fra1', 'gv2', 'muc1', 'sof1', 'vie1', 'zrh1']
regex = '^([a-zA-Z0-9-]+)\.([a-zA-Z0-9-]+).*[\s+\t+][a-zA-Z0-9]+.*generate-dns$'

switches_exception = ['net-edge', 'net-oob', 'net-mgmt']
user = 'jpmenil'
exo_user = 'exoadmin'

template = '''
Host {0}.{1}
    HostName {0}.{1}.{2}
    User {3}
    ForwardAgent yes
    HashKnownHosts no
    StrictHostKeyChecking no
    UserKnownHostsFile /dev/null
    proxycommand ssh exoadmin@bastion-{1} -p 8156 -W %h:%p
'''

def check_config():
    with open(ssh_conf, 'r') as original: data = original.read()
    if include not in data:
        with open(ssh_conf, 'w') as modified: modified.write("{0}\n".format(include) + data)

def git_rebase():
    g = git.cmd.Git(git_dir)
    try:
        g.pull("--rebase")
    except git.GitCommandError as e:
        print(e)

def construct_hosts():
    hosts = dict([(key, []) for key in zones])
    r1 = re.compile(regex)

    with open(zone, 'r') as f:
        for line in f:
            m1 = r1.search(line)
            if m1:
                host = m1.group(1)
                z = m1.group(2)
                if any(zz in z.strip() for zz in zones):
                    if host not in hosts[z.strip()]:
                        hosts[z.strip()].append(host)

    return hosts

def construct_ssh(hosts):
    if not os.path.isdir(ssh_conf_dir): os.makedirs(ssh_conf_dir)
    if os.path.exists(exo_file): os.remove(exo_file)

    with open(exo_file, 'a') as f:
        for z in hosts:
            for host in hosts[z]:
                f.write(template.format(host, z, 'p.exoscale.net', user if any(x in host for x in switches_exception) else exo_user))

if __name__ == '__main__':
    check_config()
    git_rebase()
    hosts = construct_hosts()
    construct_ssh(hosts)
