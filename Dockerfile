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
COPY --from=build /app/target/*.jar /app.jar

ENV JAVA_OPTS=""

EXPOSE ${SERVER_PORT}

HEALTHCHECK --interval=10s --timeout=3s \
  CMD curl -v --fail http://localhost:${SERVER_PORT} || exit 1

ENTRYPOINT [ "sh", "-c", "java $JAVA_OPTS -jar /app.jar" ]
