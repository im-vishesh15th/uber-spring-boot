FROM maven:3.9.0-openjdk-21 AS build
COPY . .
RUN mvn clean package -DskipTests

FROM openjdk:21-jdk-slim
COPY --from=build /target/uberApp-0.0.1-SNAPSHOT.jar uberApp.jar
EXPOSE 8080
ENTRYPOINT ["java","-jar","uberApp.jar"]


