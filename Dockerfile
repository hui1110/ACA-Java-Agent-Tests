FROM maven:3.8.1-jdk-8 as maven-builder
ARG PROJECT_NAME
ENV PROJECT_NAME=${PROJECT_NAME}
COPY . /app
WORKDIR /app
RUN mvn clean install -pl ACA-Java-Agent-Log-Level/${PROJECT_NAME} -DskipTests

FROM maven:3-eclipse-temurin-8-alpine
ARG PROJECT_NAME
ENV PROJECT_NAME=${PROJECT_NAME}
COPY --from=maven-builder app/ACA-Java-Agent-Log-Level/${PROJECT_NAME}/target/*.jar /app-service/app.jar
RUN apk add libgcc
WORKDIR /app-service
RUN wget -O agent.jar https://huiagentaccount.blob.core.windows.net/ja-agent/agent-0.0.1-SNAPSHOT.jar
EXPOSE 8080
ENTRYPOINT ["java","-javaagent:agent.jar", "-jar", "app.jar"]
