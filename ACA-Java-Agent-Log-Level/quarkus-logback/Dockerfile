FROM openjdk:11-jdk-alpine as build

# copy arthas
COPY --from=hengyunabc/arthas:latest /opt/arthas /opt/arthas

RUN apk add wget unzip tcpdump ngrep iproute2-ss bind-tools

RUN mvn clean install -DskipTests

WORKDIR /app

COPY ./ ./

COPY  ./target/quarkus-app/quarkus-run.jar /app/target/quarkus-app/quarkus-run.jar

RUN wget https://huiagentaccount.blob.core.windows.net/ja-agent/ja-agent.jar

ENTRYPOINT ["sh", "-c"]
CMD ["java -javaagent:ja-agent.jar -Xms256m -Xmx256m -jar /app/target/quarkus-app/quarkus-run.jar"]
