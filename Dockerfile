FROM maven:3.6.3-jdk-11
COPY pom.xml /workdir/pom.xml
RUN mvn clean install
COPY . /workdir
WORKDIR /workdir

CMD [ "mvn test -pl best-practice -Dtest=\!RealDevice* -X" ]
