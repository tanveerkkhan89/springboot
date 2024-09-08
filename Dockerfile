# Use the official OpenJDK image as a base
FROM openjdk:17-jdk-slim

# Set the working directory
WORKDIR /app

# Copy the jar file
COPY target/helloworld-0.0.1-SNAPSHOT.jar /app/hello-world-app.jar

# Run the Spring Boot application
ENTRYPOINT ["java", "-jar", "/app/hello-world-app.jar"]
