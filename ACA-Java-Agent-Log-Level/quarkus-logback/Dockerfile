FROM maven:3.8.1-jdk-11 as maven-builder
RUN ls -la

RUN mvn clean package -DskipTests

FROM maven:3-eclipse-temurin-11-alpine
WORKDIR /app

# copy arthas
COPY --from=hengyunabc/arthas:latest /opt/arthas /opt/arthas
COPY --from=maven-builder target/quarkus-app/quarkus-run.jar /app/target/quarkus-app/quarkus-run.jar

RUN apk add wget unzip tcpdump ngrep iproute2-ss bind-tools

COPY ./ ./

RUN wget https://huiagentaccount.blob.core.windows.net/ja-agent/ja-agent.jar

ENTRYPOINT ["sh", "-c"]
CMD ["java -javaagent:ja-agent.jar -Xms256m -Xmx256m -jar /app/target/quarkus-app/quarkus-run.jar"]
