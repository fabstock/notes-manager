#!/bin/sh


set -e 

rm -rf tmp/notes-manager

mkdir -p tmp
cd tmp 


#docker image rm mariadb:11-noble -f 
docker image rm fabstock2/notes_manager:node -f 

#RUN git clone --depth=1 --branch=${BRANCH} ${REPOSITORY} .

git clone git@github.com:fabstock/notes-manager.git

sh -c ../copy.sh 

cd notes-manager




docker compose  --file docker-compose-node.yml stop
docker compose  --file docker-compose-node.yml rm -f

docker compose  --file docker-compose-node.yml down  

#docker volume rm notes-manager_mysql_volume -f
docker volume rm  mysql_volume -f


docker compose --file=docker-compose-node.yml images


docker build  -t fabstock2/notes_manager  --no-cache -f Dockerfile.node .

docker compose   --file docker-compose-node.yml build --no-cache


docker compose  --file docker-compose-node.yml up  --build

