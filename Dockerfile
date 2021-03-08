FROM gradle:6.7.0-jdk11 AS build
ENV JAVA_OPTS "-XX:+UnlockExperimentalVMOptions -XX:+UseCGroupMemoryLimitForHeap"
COPY --chown=gradle:gradle . /home/gradle/src
WORKDIR /home/gradle/src
RUN gradle assemble --no-daemon

FROM adoptopenjdk/openjdk11:x86_64-alpine-jdk-11.0.10_9-slim
#FROM openjdk:11.0.8-jdk
EXPOSE 8080 9000
#ENV HEALTH_CHECK_URL http://localhost:9000/health
ENV OTEL_RESOURCE_ATTRIBUTES="service.name=eip1559,service.version=$VERSION"

COPY --from=build /home/gradle/src/build/libs/*.jar app.jar

ENTRYPOINT ["java","-jar","/app.jar"]
#HEALTHCHECK --start-period=5s --interval=5s --timeout=1s --retries=10 CMD bash -c "[ -f /tmp/pid ]"
