FROM maven:3 as builder

WORKDIR /click-count

COPY src src
COPY pom.xml pom.xml

RUN mvn clean package

FROM tomcat:8-jre8

RUN rm -rf webapps/*

COPY --from=builder /click-count/target/clickCount.war webapps/ROOT.war