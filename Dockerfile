FROM tomcat:9.0
RUN apt update
RUN apt install git maven docker.io -y
