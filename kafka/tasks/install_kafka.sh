#!/usr/bin/env bash

cd /home/ubuntu
git clone https://github.com/wurstmeister/kafka-docker

cd kafka-docker

git reset --hard origin/master

hostip=$(ifconfig eth0 | awk 'sub(/inet /,""){print $1}')

if grep '\- "9092"' docker-compose.yml
then 
    sed -i 's/"9092/&:9092/' docker-compose.yml
fi

if ! grep "KAFKA_ADVERTISED_HOST_NAME:"" $hostip" docker-compose.yml
then 
    sed -i 's/KAFKA_ADVERTISED_HOST_NAME:/&'" $hostip"' #/' docker-compose.yml
fi

if ! grep "KAFKA_ZOOKEEPER_CONNECT: zookeeper:2181" docker-compose.yml
then 
    sed -i 's/KAFKA_ZOOKEEPER_CONNECT:/& kafka-docker_zookeeper_1:2181 #/' docker-compose.yml
fi

if grep "kafka:" docker-compose.yml
then
    if ! grep "restart: always" docker-compose.yml
    then
        sed -i '/kafka:/a\ \ \ \ restart: always' docker-compose.yml
    fi
fi

if grep "zookeeper:" docker-compose.yml
then
    if ! grep "restart: always" docker-compose.yml
    then
        sed -i '/zookeeper:/a\ \ \ \ restart: always' docker-compose.yml
    fi
fi

docker rm -f kafka-docker_kafka_1
docker rm -f kafka-docker_zookeeper_1

docker-compose up -d
