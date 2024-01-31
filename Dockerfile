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

RUN apk update
RUN if [ "$PROJECT_NAME" = "quarkus-logback-11-aca" ] ; then \
        apk add --no-cache openjdk11 && apk add --no-cache maven=3.8.1-r0; \
    elif [ "$PROJECT_NAME" = "quarkus-logback-17-aca" ] ; then \
         apk add --no-cache openjdk17 && apk add --no-cache maven=3.8.1-r0; \
    elif [ "$PROJECT_NAME" = "quarkus-logback-21-aca" ] ; then \
             apk add --no-cache openjdk21 && apk add --no-cache maven=3.8.1-r0; \
    else \
        apk add --no-cache openjdk8 && apk add --no-cache maven=3.8.1-r0; \
    fi \
