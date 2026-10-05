FROM eclipse-temurin:17-jdk-alpine
WORKDIR /app
COPY . .
RUN ./mvnw package -DskipTests || mvn package -DskipTests
EXPOSE 8080
CMD ["java", "-jar", "target/service-offreEmploi-0.0.1-SNAPSHOT.jar"]
