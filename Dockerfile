# Use an official Maven image to build the app
FROM centos
RUN mkdir /opt/tomcat/

WORKDIR /opt/tomcat
RUN curl -O https://www-eu.apache.org/dist/tomcat/tomcat-8/v8.5.40/bin/apache-tomcat-8.5.40.tar.gz
RUN tar xvfz apache.tar.gz
RUN mv apache-tomcat-8.5.40/ /opt/tomcat/.
RUN yum -y install java
RUN java -version
# Set the working directory inside the container
WORKDIR /opt/tomcat/webapps

# Copy the Maven build file (pom.xml) and the source code
#COPY pom.xml .
#COPY src ./src

# Package the application (build the JAR file)
#RUN mvn clean package -Dmaven.test.skip=true
# Second stage: use a lighter image to run the application
#FROM openjdk:11-jre-slim

# Copy the built JAR file from the Maven build container
COPY --from=build /app/target/demo2-1.0-SNAPSHOT.war /opt/tomcat/webapps/demo2-1.0-SNAPSHOT.war

# Expose the port your application will run on
EXPOSE 8080

# Define the command to run your app
CMD ["/opt/tomcat/bin/catalina.sh", "run"]