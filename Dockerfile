# Use a base image that includes JDK
FROM openjdk:22-jdk-slim

# Set the working directory
WORKDIR /app

# Copy the jar file into the container
COPY target/spring-boot-kafka-1.0.0.jar app.jar

# Expose the application port (change if necessary)
EXPOSE 8080

# Command to run the application
CMD ["java", "-jar", "app.jar"]