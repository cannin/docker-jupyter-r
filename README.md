# Jupyter with Python and R
## Single Instance
```
docker build -t cannin/jupyter-r .

docker run -i --name jupyter -p 8888:8888 -t cannin/jupyter-r /bin/bash
docker run --name jupyter -p 8888:8888 -t cannin/jupyter-r
docker exec -t jupyter /bin/bash

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
           cannin/tmpnb python orchestrate.py \
           --image='cannin/jupyter-r' \
           --pool_size=3 \
           --cull_period=600 \
           --cull_timeout=3600        
```

## Stop and remove all tmpnb/Jupyter containers
```
sudo docker stop tmpnb
sudo docker stop proxy

sudo docker ps -a | grep jupyter | cut -d ' ' -f 1 | xargs sudo docker stop 

sudo docker ps -a | grep Exit | cut -d ' ' -f 1 | xargs sudo docker rm
```

## Access Jupyter server
* URL: http://ROOT_URL:8000/user/PUT_ANY_USERNAME_HERE

## Access ipyrmd
```
# ipyrmd from: https://github.com/chronitis/ipyrmd
docker run -i -v HOST_PATH:/tmp -t cannin/jupyter-r /bin/bash

# Run ipyrmd
```
ipyrmd --to ipynb --from Rmd -y -o OUT IN

# Included files
ipyrmd --to ipynb --from Rmd -y -o using_r.ipynb using_r.Rmd
ipyrmd --to ipynb --from Rmd -y -o intro_machine_learning.ipynb intro_machine_learning.Rmd
ipyrmd --to ipynb --from Rmd -y -o using_rcellminer.ipynb using_rcellminer.Rmd
ipyrmd --to ipynb --from Rmd -y -o using_paxtoolsr.ipynb using_paxtoolsr.Rmd
ipyrmd --to ipynb --from Rmd -y -o cgdsr.ipynb cgdsr.Rmd
```
