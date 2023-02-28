FROM tomcat:9.0
# ADD /var/webapp/mycalcwebapp.war /usr/local/tomcat/webapps/
# ADD /tmp/calcul/target/mycalcwebapp.war /usr/local/tomcat/webapps/
ADD /tmp/mycalcwebapp.war /usr/local/tomcat/webapps/