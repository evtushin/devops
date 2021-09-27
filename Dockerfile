FROM tomcat:10.0.11
RUN apt-get update
RUN apt-get install maven -y
RUN apt-get install git -y
WORKDIR /tmp/
RUN git clone https://github.com/boxfuse/boxfuse-sample-java-war-hello.git
WORKDIR /tmp/boxfuse-sample-java-war-hello/
RUN mvn package
RUN cp -f /tmp/boxfuse-sample-java-war-hello/target/hello-1.0.war /usr/local/tomcat/webapps/boxfuse.war
CMD ["catalina.sh", "run"]
