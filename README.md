# 1 Overview
This is a docker repo for elasticsearch cerebro in one single docker container

# 2 Instruction
## 2.1 Install Docker
https://docs.docker.com/engine/installation/

## 2.2 Pull down the git repo
```bash
git clone git@github.com:Shuliyey/elasticsearch_cerebro.git
```

## 2.3 Make sure you are under the root directory of the elkc git repo
```bash
cd elasticsearch_cerebro
```

## 2.4 Build docker image
```bash
docker build -t elasticsearch_cerebro:<tag> .
```

## 2.5 Run docker container
```bash
docker run -it -d \
  -p 9000:9000 -p 9300:9300 -p 9200:9200 \
  -v elasticsearch/config:/usr/share/elasticsearch/config \
  -v elasticsearch/data:/usr/share/elasticsearch/data \
  -v cerebro/conf:/usr/share/cerebro/default/conf \
  -v supervisord.conf:/etc/supervisor/conf.d/supervisord.conf \
  elasticsearch_cerebro:<tag> 
```
