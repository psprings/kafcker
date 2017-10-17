# kafcker
Collection of Docker resources for Kafka in a sandbox environment

This is based on original work done by `wurstmeister`
Please check out the repo here: https://github.com/wurstmeister/kafka-docker

I have made some modifications to fit some of my use-cases and to make local
development a little bit easier.

## Getting started
### Initialize the stack
To start the stack run:
```bash
# Downloads images, allocates network, and starts all containers
# in the background.
docker-compose up -d
```

To view logs at any time:
```bash
docker-compose logs -f
```

### Interact with the stack
To start a shell to interact
```bash
./start-kafka-shell.sh
```

Once inside of the shell you can run the commands detailed [here](https://wurstmeister.github.io/kafka-docker/) in the Testing
section:

*Reference: https://wurstmeister.github.io/kafka-docker/*


#### Initialize topic
```bash
# Create a topic called "topic"
$KAFKA_HOME/bin/kafka-topics.sh --create --topic topic \
--partitions 4 --zookeeper $ZK --replication-factor 1
# Check to make sure that topic exists
$KAFKA_HOME/bin/kafka-topics.sh --describe --topic topic --zookeeper $ZK
```

#### Start producing
```bash
# Start producer
$KAFKA_HOME/bin/kafka-console-producer.sh --topic=topic \
--broker-list=`broker-list.sh`
```
Anything typed in the stdin will be sent as a message to the topic

#### Start consuming
In a separate tab/window navigate to the cloned kafcker directory and run the following commands:
```bash
# Start shell
./start-kafka-shell.sh
# Start consumer
$KAFKA_HOME/bin/kafka-console-producer.sh --topic=topic \
--broker-list=`broker-list.sh`
```

Any messages sent via the producer, should be seen in the consumer window/tab.
