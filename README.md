# shconf

## Preparation

- centralized conf: ``app.conf``

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

- overwritten conf: ``nginx.conf``

code snippets of ``example/nginx.conf`` :

```
upstream databaseupstream {
        server ${backend.service};
}

server {
  listen       ${port};
  server_name  ${host};

  location /boxstore {
     alias ${boxstore.root.dir};
     autoindex on;
     autoindex_exact_size  off;
     autoindex_localtime on;
  }

}  

```

## What to do

overwrite placeholder variables like ``${backend.service}``, ``${port}`` and ``${boxstore.root.dir}`` refereed in ``example/nginx.conf`` with the value assigned in ``example/app.conf`` before ``example/nginx.conf`` loaded by application such as ``nginx`` http server.


## How to

```
replaceby.sh example/nginx.conf example/app.conf
```

## Other Tools

- get value of specified key

```
$ sh getprop.sh backend.service example/app.conf
10.10.1.100:8080
```

- set value of specified key

```
$ setprop.sh backend.service 127.0.0.1:10086 example/app.conf
$ sh getprop.sh backend.service example/app.conf
127.0.0.1:10086
```
