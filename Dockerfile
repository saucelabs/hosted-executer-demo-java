FROM maven:3.6.3-jdk-11
COPY . /workdir
WORKDIR /workdir

CMD [ "mvn test -pl best-practice -Dtest=\!RealDevice* -X" ]