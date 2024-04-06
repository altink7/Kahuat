FROM openjdk:17-jdk-slim

WORKDIR /app

COPY target/spring-rest-backend-0.0.1.war /app/spring-rest-backend-0.0.1.war

EXPOSE 8081

CMD ["java", "-jar", "spring-rest-backend-0.0.1.war"]