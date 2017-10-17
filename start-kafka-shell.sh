#!/bin/bash
docker run --rm --network=$(docker network ls --filter name=kafka-cluster -q) -it -v /var/run/docker.sock:/var/run/docker.sock -e HOST_IP=kafka -e ZK=zookeeper:2181 wurstmeister/kafka /bin/bash
