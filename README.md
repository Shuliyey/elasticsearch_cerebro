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
docker build -t elasticsearch\_cerebro:<tag> .

## 2.5 Run docker container
docker run -it -d elasticsearch\_cerebro:<tag>
