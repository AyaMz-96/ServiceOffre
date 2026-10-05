FROM maven:3.8.4-openjdk-17 AS build
WORKDIR /app

# نسخ كافة الملفات
COPY . .

# إنشاء مجلدات src وإعادة تنظيم الملفات تلقائياً لبنائها
RUN mkdir -p src/main/java/com/iset/entities src/main/java/com/iset/web src/main/resources
RUN cp -f Offre.java src/main/java/com/iset/entities/ 2>/dev/null || true
RUN cp -f RestOffres.java src/main/java/com/iset/web/ 2>/dev/null || true
RUN cp -f application.properties src/main/resources/ 2>/dev/null || true

# بناء الملف
RUN mvn clean package -DskipTests

FROM openjdk:17-jdk-slim
WORKDIR /app
COPY --from=build /app/target/*.jar app.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "app.jar"]
