FROM openjdk:11
COPY . /workdir
WORKDIR /workdir
CMD [ "mvn test -pl best-practice -Dtest=\!RealDevice* -X" ]
