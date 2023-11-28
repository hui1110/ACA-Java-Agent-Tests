FROM maven:3.8.1-jdk-8 as maven-builder
COPY . /app
WORKDIR /app
RUN mvn clean install -pl ACA-Java-Agent-Integration-Test -DskipTests

FROM openjdk:8
COPY --from=maven-builder app/ACA-Java-Agent-Integration-Test/target/*.jar /app-service/app.jar
WORKDIR /app-service
RUN wget -O agent.jar https://huiagentaccount.blob.core.windows.net/agent-8/java-accelerator-agent-0.0.1-SNAPSHOT.jar
EXPOSE 8080
ENTRYPOINT ["java","-javaagent:agent.jar", "-jar", "app.jar"]
