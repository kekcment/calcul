FROM tomcat:9.0
# ADD /var/webapp/mycalcwebapp.war /usr/local/tomcat/webapps/
ADD /tmp/calculator-servlet-example/target/mycalcwebapp.war /usr/local/tomcat/webapps/