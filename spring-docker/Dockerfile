FROM maven:3.8.1-jdk-8 as maven-builder
ARG PROJECT_NAME
ENV PROJECT_NAME=${PROJECT_NAME}
COPY .. /app
WORKDIR /app
RUN mvn clean install -pl ACA-Java-Agent-Log-Level/${PROJECT_NAME} -DskipTests

FROM tomcat:8.5-jdk8-openjdk
ARG PROJECT_NAME
ENV PROJECT_NAME=${PROJECT_NAME}
COPY --from=maven-builder app/ACA-Java-Agent-Log-Level/${PROJECT_NAME}/target/*.war app.war
RUN rm -fr /usr/local/tomcat/webapps/*
ADD app.war /usr/local/tomcat/webapps/ROOT.war

ADD ja-agent.jar /usr/local/tomcat/agent/ja-agent.jar
ADD setenv.sh /usr/local/tomcat/bin/setenv.sh
RUN chmod +x /usr/local/tomcat/bin/setenv.sh

CMD ["catalina.sh","run"]
