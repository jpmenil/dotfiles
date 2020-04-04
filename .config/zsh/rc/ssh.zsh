# -*- sh -*-

ssh() {
    string="$@"
    exception=net-
    lab=vMX
    if [ "${string#*$exception}" != "$string" ] || [ "${string#*$lab}" != "$string" ]; then
        LC__ORIGINALTERM=$TERM TERM=screen LANG=C LC_MESSAGES=C command ssh "$@"
    else
        LC__ORIGINALTERM=$TERM TERM=screen-256color LANG=C LC_MESSAGES=C command ssh "$@"
    fi

}

# The following command implements a reverse SSH connection. This is
# to connect to hosts behind a firewall, which can connect to your
# machine but you cannot connect directly. The idea is that they issue
# a TCP connection that you will use as a tunnel to access their SSH
# port.
#
# I am using this to connect to VM using user-mode network (QEMU, KVM,
# UML, ...).
rssh() {
    # We should probe for a free port, but is it easy?
    local port
    port=$((21422 + $RANDOM % 1000))

    print "On remote host, use \`socat TCP:10.0.2.2:$port TCP:127.0.0.1:22\` to allow SSH access... "
    ssh -oProxyCommand="socat TCP-LISTEN:$port,bind=127.0.0.1,reuseaddr STDIO" \
        "$@"
}
