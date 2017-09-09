
This project provides a simple example of using Docker containers to build and run a Java application without installing Java. The sample is referenced in the DZone article [Containers are the new Build Artifact](https://dzone.com/articles/containers-are-the-new-build-artifact).

This sample does not use the Smartsheet API.

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
docker build -t hello-world:8u131 -f Dockerfile-8u131 .
```

## Run Container

Once we have a compiled Java class we can simply execute it with a Java Runtime Environment (JRE).

```
docker run -it --rm=true hello-world:8u131
```

## Build and Run Container with Java 9

Let's assume we also want to run our Java class in a Java 9 environment to test it. We can easily take 
the same artifact (our HelloWorld.class file) that was compiled with Java 8u131 and run it
in a Java 9 container. We use a different Dockerfile which specifies the Java 9 JVM as the base image.
Then we build it and tag it so we have both the Java 8 and Java 9 images to run either.

```
docker build -t hello-world:9b170 -f Dockerfile-9b170 .
docker run -it --rm=true hello-world:9b170
```
