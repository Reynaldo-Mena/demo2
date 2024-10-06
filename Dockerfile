# Use an official Maven image to build the app
FROM maven:3.8.1-openjdk-11 AS build

# Set the working directory inside the container
WORKDIR /app

# Copy the Maven build file (pom.xml) and the source code
COPY pom.xml .
COPY src ./src

# Package the application (build the JAR file)
RUN mvn clean package -Dmaven.test.skip=true

FROM tomcat:8.0-alpine




# Package the application (build the JAR file)
#RUN mvn clean package -Dmaven.test.skip=true
# Second stage: use a lighter image to run the application
#FROM openjdk:11-jre-slim

# Copy the built JAR file from the Maven build container
COPY --from=build /app/target/demo2-1.0-SNAPSHOT.war /usr/local/tomcat/webapps/demo2-1.0-SNAPSHOT.war

# Expose the port your application will run on
EXPOSE 8080

# Define the command to run your app
CMD ["catalina.sh", "run"]