# shconf

## Preparation

- ``app.conf``

a global configuration file ``example/app.conf`` :

```
#
# application global configuration
#

host=192.168.1.100  # nginx listening host
# nginx listenning port
port =  80

backend.service=10.10.1.100:8080
boxstore.root.dir=/opt/boxstore

#sync=false
not.found.key=NotFound

Other lines

```
