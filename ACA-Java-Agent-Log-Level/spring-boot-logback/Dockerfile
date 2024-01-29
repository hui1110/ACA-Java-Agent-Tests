FROM maven:3.8.1-jdk-8 as maven-builder
RUN ls -la
RUN mvn clean package -DskipTests

FROM maven:3-eclipse-temurin-8-alpine as build

# copy arthas
COPY --from=hengyunabc/arthas:latest /opt/arthas /opt/arthas
COPY --from=maven-builder demo/target/spring-boot-logback-1.0.0.jar /app/target/spring-boot-logback-1.0.0.jar

#RUN apk add wget unzip tcpdump ngrep iproute2-ss bind-tools
RUN apk add libgcc

WORKDIR /app

COPY ./ ./


RUN wget https://huiagentaccount.blob.core.windows.net/ja-agent/ja-agent.jar

ENTRYPOINT ["sh", "-c"]
CMD ["java -javaagent:ja-agent.jar -Xms256m -Xmx256m -jar /app/target/spring-boot-logback-1.0.0.jar"]


