FROM maven:3.6.3-jdk-11
COPY . .
RUN mvn clean install -DskipTests

CMD [ "mvn test -pl best-practice -Dtest=\!RealDevice* -X" ]
