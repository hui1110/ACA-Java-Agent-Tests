FROM maven:3-eclipse-temurin-8-alpine as build

# copy arthas
COPY --from=hengyunabc/arthas:latest /opt/arthas /opt/arthas

#RUN apk add wget unzip tcpdump ngrep iproute2-ss bind-tools
#RUN apk add libgcc
WORKDIR /app

COPY ./ ./

COPY  ./target/spring-boot-log4j2-1.0.0.jar /app/target/spring-boot-log4j2-1.0.0.jar
COPY  ja-agent.jar /app/ja-agent.jar

ENTRYPOINT ["sh", "-c"]
CMD ["java -javaagent:/app/ja-agent.jar -javaagent:/app/opentelemetry-javaagent.jar -Dotel.traces.exporter=otlp -Xms256m -Xmx256m -jar /app/target/spring-boot-log4j2-1.0.0.jar"]
