FROM eclipse-temurin:17-jdk-alpine

# تثبيت Maven
RUN apk add --no-mode maven || apk add maven

WORKDIR /app
COPY . .

# بناء المشروع
RUN mvn package -DskipTests

EXPOSE 8080
CMD ["java", "-jar", "target/service-offreEmploi-0.0.1-SNAPSHOT.jar"]
