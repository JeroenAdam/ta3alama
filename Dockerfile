#FROM jhipster/jhipster:v6.5.1
#USER root
#COPY . /code/
#RUN rm -Rf /code/target /code/build && \
#    mv /code/m2prod/.m2 /root/.m2 && \
#    cd /code/ && \
#    chmod +x mvnw && \
#    ./mvnw clean package -Pprod -DskipTests && \
#    mv /code/target/*.jar /app.jar

FROM openjdk:8-jre-alpine
LABEL ta3alama <ta3alama>
ENV SPRING_OUTPUT_ANSI_ENABLED=ALWAYS \
    JHIPSTER_SLEEP=0 \
    JAVA_OPTS=""
EXPOSE 8080
CMD echo "The application will start in ${JHIPSTER_SLEEP}s..." && \
    sleep ${JHIPSTER_SLEEP} && \
    java ${JAVA_OPTS} -Djava.security.egd=file:/dev/./urandom -jar /app.jar
COPY ./target/ta-3-alama-0.0.1-SNAPSHOT.jar ./app.jar
#COPY --from=0 /app.jar .
