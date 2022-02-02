from diagrams import Cluster, Diagram, Edge
from diagrams.onprem.compute import Server
from diagrams.onprem.network import Internet
from diagrams.onprem.network import Nginx

# Variables
outformat = "png"
filename = "proxyssl"
direction = "TB"


with Diagram(
    direction=direction,
    filename=filename,
    outformat=outformat,
) as diag:
    # Non Clustered
    user = Server("client")
    proxy = Server("MITMproxy")
    www1 = Nginx("www1")
    www2 = Nginx("www2")
    internet = Internet("internet")
    vagrant_website = Nginx("Vagrant Website")
 
    # Diagram
    user >> proxy >> [www1, 
                      www2,
                      internet]
    internet >> vagrant_website

diag
