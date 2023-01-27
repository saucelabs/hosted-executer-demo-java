# original
#FROM maven:3.6.3-jdk-11
#COPY . /workdir
#WORKDIR /workdir
#CMD [ "mvn test -pl best-practice -Dtest=\!RealDevice* -X" ]

#-----

#inspired by https://codefresh.io/blog/java_docker_pipeline/
FROM openjdk:8-jdk-alpine
# ----
# Install Maven
RUN apk add --no-cache curl tar bash
ARG MAVEN_VERSION=3.3.9
ARG USER_HOME_DIR="/root"
RUN mkdir -p /usr/share/maven && \
curl -fsSL http://apache.osuosl.org/maven/maven-3/$MAVEN_VERSION/binaries/apache-maven-$MAVEN_VERSION-bin.tar.gz | tar -xzC /usr/share/maven --strip-components=1 && \
ln -s /usr/share/maven/bin/mvn /usr/bin/mvn
ENV MAVEN_HOME /usr/share/maven
ENV MAVEN_CONFIG "$USER_HOME_DIR/.m2"
# speed up Maven JVM a bit
ENV MAVEN_OPTS="-XX:+TieredCompilation -XX:TieredStopAtLevel=1"
# ENTRYPOINT ["/usr/bin/mvn"]
# ----
# Install project dependencies and keep sources
COPY . /workdir
WORKDIR /workdir

RUN mvn -pl best-practice install -DskipTests=true 