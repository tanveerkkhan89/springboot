# Use the official OpenJDK image as a base
FROM openjdk:17-jdk-slim

# Set the working directory
WORKDIR /app

# Copy the jar file
COPY target/my-spring-app.jar /app/my-spring-app.jar

# Run the Spring Boot application
ENTRYPOINT ["java", "-jar", "/app/my-spring-app.jar"]
