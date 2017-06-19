
Simple example of using Docker containers to build and run a Java application.

## Compile Java Class

When building a Java application we need a Java Development Kit (JDK). We can use an 
existing Docker image with a JDK in it to build our class.

```
docker run -it -v $(pwd):/build openjdk:8u131-jdk-alpine javac /build/HelloWorld.java
```

## Build Docker Container Image

We can then take our Java class file (aka our build artifact) and bundle it into a 
container image.

```
docker build -t hello-world .
```

## Run Container

Once we have a compiled Java class we can simply execute it with a Java Runtime Environment (JRE).

```
docker run -it --rm=true hello-world
```
