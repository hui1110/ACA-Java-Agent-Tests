FROM maven:3-eclipse-temurin-11-alpine as build

# copy arthas
COPY --from=hengyunabc/arthas:latest /opt/arthas /opt/arthas

RUN apk add wget unzip tcpdump ngrep iproute2-ss bind-tools

WORKDIR /app

COPY ./ ./

COPY  ./target/spring-boot-log4j-1.0.0.jar /app/target/spring-boot-log4j-1.0.0.jar

RUN wget https://jimmyfangstorage1.blob.core.windows.net/jar/java-accelerator-agent-0.0.1-SNAPSHOT.jar

ENTRYPOINT ["sh", "-c"]
CMD ["java -javaagent:/app/java-accelerator-agent-0.0.1-SNAPSHOT.jar -Xms256m -Xmx256m -jar /app/target/spring-boot-log4j-1.0.0.jar"]
