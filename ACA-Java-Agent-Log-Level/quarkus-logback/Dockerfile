FROM maven:3.8.1-jdk-11 as maven-builder
RUN ls -la
COPY src /demo/src
COPY pom.xml /demo
RUN mvn -f /demo/pom.xml clean package -DskipTests
RUN ls -la /demo/target/quarkus-app
RUN src0 /demo/src

FROM maven:3-eclipse-temurin-11-alpine
WORKDIR /app

# copy arthas
COPY --from=hengyunabc/arthas:latest /opt/arthas /opt/arthas
COPY --from=maven-builder demo/target/quarkus-app/quarkus-run.jar /app/target/quarkus-app/quarkus-run.jar

RUN apk add wget unzip tcpdump ngrep iproute2-ss bind-tools

COPY ./ ./

RUN wget https://huiagentaccount.blob.core.windows.net/ja-agent/ja-agent.jar

ENTRYPOINT ["sh", "-c"]
CMD ["java -javaagent:ja-agent.jar -Xms256m -Xmx256m -jar /app/target/quarkus-app/quarkus-run.jar"]
