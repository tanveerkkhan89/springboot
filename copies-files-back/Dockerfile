# syntax=docker/dockerfile:1

# Build image
FROM eclipse-temurin:19-jdk-jammy AS build

WORKDIR /app

# Copy Maven Wrapper and configuration files
COPY .mvn/ .mvn/
COPY mvnw pom.xml ./

# Install Maven dependencies
RUN chmod +x mvnw && ./mvnw dependency:resolve

# Copy application source code
COPY src ./src

# Package the application
RUN ./mvnw clean package

# Runtime image
FROM eclipse-temurin:19-jre

# Copy the JAR file from the build stage
COPY --from=build /app/target/*.jar /app.jar

# Set the port on which the application will run
ENV SERVER_PORT=8080

EXPOSE ${SERVER_PORT}

# Health check command
HEALTHCHECK --interval=10s --timeout=3s \
  CMD curl -v --fail http://localhost:${SERVER_PORT} || exit 1

# Run the application
ENTRYPOINT ["sh", "-c", "java $JAVA_OPTS -jar /app.jar"]
