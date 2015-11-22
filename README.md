# Jupyter with Python and R
## Single Instance
```
docker build -t cannin/jupyter-r .

docker run --name jupyter -p 8888:8888 -t cannin/jupyter-r /bin/bash
docker exec -t jupyter-r /bin/bash

docker run -p 8888:8888 -v DIR:/workspace cannin/jupyter-r
```

# Using tmpnb
## From: https://github.com/jupyter/tmpnb
```
docker pull cannin/jupyter-r
export TOKEN=$( head -c 30 /dev/urandom | xxd -p )
docker run --net=host -d -e CONFIGPROXY_AUTH_TOKEN=$TOKEN --name=proxy jupyter/configurable-http-proxy --default-target http://127.0.0.1:9999
docker run --net=host -d -e CONFIGPROXY_AUTH_TOKEN=$TOKEN --name=tmpnb \
           -v /var/run/docker.sock:/docker.sock \
           cannin/tmpnb python orchestrate.py --image='cannin/jupyter-r'
```

## Access Jupyter server
* URL: http://ROOT_URL:8000/user/PUT_ANY_USERNAME_HERE
