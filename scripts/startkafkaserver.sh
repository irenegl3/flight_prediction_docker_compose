#!/bin/bash

python3 ../scripts/update-kafka.py
./bin/kafka-server-start.sh config/server.properties 

sleep 15

./bin/kafka-topics.sh \
    --create \
    --zookeeper zookeeper:2181 \
    --replication-factor 1 \
    --partitions 1 \
    --topic flight_delay_classification_request