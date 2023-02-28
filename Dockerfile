FROM tomcat:9.0.72-jre11
# ADD /var/webapp/mycalcwebapp.war /usr/local/tomcat/webapps/
# ADD /tmp/calcul/target/mycalcwebapp.war /usr/local/tomcat/webapps/
ADD ./target/mycalcwebapp.war /usr/local/tomcat/webapps/