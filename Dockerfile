FROM eclipse-temurin:17-jdk-alpine

RUN apk add --no-mode maven || apk add maven

WORKDIR /app
COPY . .

RUN mvn package -DskipTests

EXPOSE 8080
CMD ["java", "-jar", "target/service-offreEmploi-0.0.1-SNAPSHOT.jar"]
