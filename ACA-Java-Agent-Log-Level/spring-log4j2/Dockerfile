FROM tomcat:8.5-jdk8-openjdk
RUN rm -fr /usr/local/tomcat/webapps/*
ADD ./target/spring-log4j2-1.0.0.war /usr/local/tomcat/webapps/ROOT.war

ADD ja-agent.jar /usr/local/tomcat/agent/ja-agent.jar
ADD setenv.sh /usr/local/tomcat/bin/setenv.sh
RUN chmod +x /usr/local/tomcat/bin/setenv.sh

CMD ["catalina.sh","run"]
