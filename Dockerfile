FROM maven:3.8.1-jdk-8 as maven-builder
COPY . /app
WORKDIR /app
RUN mvn clean install -pl ACA-Java-Agent-Log-Level/spring-boot-logback -DskipTests

FROM maven:3-eclipse-temurin-8-alpine
COPY --from=maven-builder app/ACA-Java-Agent-Log-Level/spring-boot-logback/target/*.jar /app-service/app.jar
RUN apk add libgcc
WORKDIR /app-service
RUN wget -O agent.jar https://huiagentaccount.blob.core.windows.net/ja-agent/ja-agent.jar
EXPOSE 8080
ENTRYPOINT ["java","-javaagent:agent.jar", "-jar", "app.jar"]
