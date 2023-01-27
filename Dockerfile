FROM maven:3.6.3-jdk-11
WORKDIR /workdir
COPY pom.xml pom.xml
RUN mvn clean install
COPY . .

CMD [ "mvn test -pl best-practice -Dtest=\!RealDevice* -X" ]
