from mininet.net import Mininet
from mininet.node import Node, OVSBridge
from mininet.cli import CLI
from mininet.log import setLogLevel


class LinuxRouter(Node):
    """A Linux node acting as a router."""

    def config(self, **params):
        super().config(**params)
        self.cmd("sysctl -w net.ipv4.ip_forward=1")

    def terminate(self):
        self.cmd("sysctl -w net.ipv4.ip_forward=0")
        super().terminate()


def run():
    net = Mininet(controller=None, switch=OVSBridge)

    print("*** Creating nodes")

    h1 = net.addHost("h1", ip="10.0.1.2/24")
    h2 = net.addHost("h2", ip="10.0.2.2/24")

    r1 = net.addHost("r1", cls=LinuxRouter)

    s1 = net.addSwitch("s1")
    s2 = net.addSwitch("s2")

    print("*** Creating links")

    net.addLink(h1, s1)
    net.addLink(s1, r1)

    net.addLink(r1, s2)
    net.addLink(s2, h2)

    print("*** Starting network")

    net.start()

    # Configure router interfaces
    r1.cmd("ip addr add 10.0.1.1/24 dev r1-eth0")
    r1.cmd("ip addr add 10.0.2.1/24 dev r1-eth1")

    # Configure default gateways
    h1.cmd("ip route add default via 10.0.1.1")
    h2.cmd("ip route add default via 10.0.2.1")

    CLI(net)

    net.stop()


if __name__ == "__main__":
    setLogLevel("info")
    run()