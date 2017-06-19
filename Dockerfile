FROM openjdk:8u131-jre-alpine
ENV HW_HOME=/opt/hello-world
ADD HelloWorld.class $HW_HOME/
WORKDIR $HW_HOME
ENTRYPOINT ["java", "HelloWorld"]
