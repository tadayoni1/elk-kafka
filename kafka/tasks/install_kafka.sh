cd /home/ubuntu
git clone https://github.com/wurstmeister/kafka-docker

cd kafka-docker

hostip=$(ifconfig eth0 | awk 'sub(/inet /,""){print $1}')

sed -i 's/KAFKA_ADVERTISED_HOST_NAME:/&'" $hostip"' #/' docker-compose.yml

docker rm -f kafka-docker_kafka_1
docker rm -f kafka-docker_zookeeper_1

docker-compose up
