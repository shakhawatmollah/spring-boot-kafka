# Kafka with Spring Boot

## Kafka Setup and Spring Boot Integration

This guide walks you through the process of setting up Kafka on Windows, using Docker, and integrating Kafka with a Spring Boot application.

## Kafka Setup on Windows

### Step 1: Start Zookeeper
```bash
zookeeper-server-start.bat ..\..\config\zookeeper.properties
```

### Step 2: Start Kafka Broker
```bash
kafka-server-start.bat ..\..\config\server.properties
```

### Step 3: Audit/Check Kafka Topics

Navigate to the Kafka bin directory:
```bash
cd ...\kafka_2.13-3.8.0\bin\windows
```

To consume messages from a Kafka topic:
```bash
kafka-console-consumer.bat --bootstrap-server localhost:9092 --topic my-topic --from-beginning
```

With key separator and printing key disabled:
```bash
kafka-console-consumer.bat --bootstrap-server localhost:9092 --topic my-topic --from-beginning --property "key.separator=-" --property "print.key=false"
```

## Docker Compose Setup

To start the Kafka setup using Docker Compose:
```bash
docker-compose up -d
```

## CMAK (Cluster Manager for Apache Kafka)

You can manage and monitor Kafka topics using CMAK:
- Access the CMAK web interface at: [http://localhost:9000/clusters/cluster-1/topics/my-topic](http://localhost:9000/clusters/cluster-1/topics/my-topic)

## Creating the Spring Boot Application Docker Image

To build a Docker image for your Spring Boot application:
```bash
docker build -t spring-boot-kafka .
```

## Sending Messages to Kafka

### Using `curl` with Kafka REST Proxy
Send a message using Kafka's REST API:
```bash
curl -X POST -H "Content-Type: application/vnd.kafka.json.v2+json" --data '{"key": "my-key", "value": "my-message"}' http://localhost:9000/clusters/cluster-1/topics/my-topic
```

### Sending Messages to Spring Boot Endpoint
Send a message to Kafka through the Spring Boot application:
```bash
curl -X POST "http://localhost:8080/kafka/publish?key=myKey&message=Hello+from+Kafka"
```

## Additional Resources
- [Kafka Documentation](https://kafka.apache.org/documentation/)
- [Spring Boot Documentation](https://spring.io/projects/spring-boot)
```
