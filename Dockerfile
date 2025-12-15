# Build Image - image used to build artifacts.
FROM maven:3.9.11-amazoncorretto-21-debian AS BUILD_IMAGE
RUN apt update && apt install -y git
RUN git clone -b main https://github.com/arvindjai/vprofile-project.git
WORKDIR /vprofile-project
RUN mvn install

# Service Image - image where actual app will be hosted
FROM tomcat:10-jdk21-temurin-jammy
RUN rm -rf /usr/local/tomcat/webapps/*
COPY --from=BUILD_IMAGE /vprofile-project/target/vprofile-v2.war /usr/local/tomcat/webapps/ROOT.war

EXPOSE 8080
CMD ["catalina.sh", "run"]