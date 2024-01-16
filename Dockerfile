#FROM openjdk:17-alpine
#
#EXPOSE 8080
#
#ARG JAR_FILE=build/libs/*.jar
#COPY ${JAR_FILE} app.jar
#
#ENTRYPOINT ["java","-jar","/app.jar"]

FROM gradle:7.4-jdk17-alpine as builder
WORKDIR /build

COPY build.gradle settings.gradle
RUN gradle build -x test --parallel --continue > /dev/null 2>&1 || true

COPY . /build
RUN gradle build -x test --parallel

FROM openjdk:17.0-slim
WORKDIR /app

COPY --from=builder /build/build/libs/docker-0.0.1-SNAPSHOT.jar .

EXPOSE 8080

USER nobody
ENTRYPOINT [                                                \
    "java",                                                 \
    "-jar",                                                 \
    "-Djava.security.egd=file:/dev/./urandom",              \
    "-Dsun.net.inetaddr.ttl=0",                             \
    "docker-0.0.1-SNAPSHOT.jar"              \
]