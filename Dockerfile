FROM maven:3.5.4-jdk-8-alpine as maven
WORKDIR /app
COPY . .
RUN mvn clean install package

 

FROM tomcat:8-alpine

 


COPY --from=maven /app/target/*.war /usr/local/tomcat/webapps
#ADD works-with-heroku-1.0.war   /usr/local/tomcat/webapps

 

 


EXPOSE 8080

 

 

CMD /usr/local/tomcat/bin/catalina.sh run
