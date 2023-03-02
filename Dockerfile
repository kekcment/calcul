FROM tomcat:9.0.72-jre11
ADD ./target/mycalcwebapp.war /usr/local/tomcat/webapps/