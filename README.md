[![Build Status](https://build.adambahri.com/buildStatus/icon?job=ta3alama)](https://build.adambahri.com/job/ta3alama/)
# ta3alama

This demo application was generated using [JHipster](https://www.jhipster.tech).
Some of the used technologies: [Java](https://openjdk.java.net), [Spring Boot](https://spring.io/projects/spring-boot), [Elasticsearch](https://github.com/elastic/elasticsearch). You can see the pom.xml for more details.
This repository serves as a sandbox environment for my personal CI/CD (Continuous Integration/Continuous Deployment) pipeline consisting of:
 * [Jenkins](https://jenkins.io) (build server)
 * Protractor end-to-end testing (I plan on using [Cypress](https://www.cypress.io) in the future)
 * [Docker](https://www.docker.com) (Docker-in-Docker approach)
 * [SonarQube](https://www.sonarsource.com/java/) (code quality inspection)
 * [Harbor](https://goharbor.io) (self-hosted Docker registry)
 * [Watchtower](https://github.com/containrrr/watchtower) (watching for updated Docker image, updating running container)

I'm using this DevOps workflow while coding my first large project, a [Java webapp - Content sharing platform](https://github.com/JeroenAdam/Content-sharing-platform).
Later on, I'll launch a self-hosted [RocketChat](https://rocket.chat) server for team collaboration and maybe I'll open-source the project so that more people can join.

## Jenkins server

I used the Jhipster 6.5.1 demo app for this Jenkins pipeline and went for the Docker-in-Docker approach.
The build includes Protractor e2e testing, SonarQube code quality inspection, a Docker push to registry and an e-mail alert.

About Jenkins and Docker-in-Docker, a good explanation [here](https://medium.com/swlh/quickstart-ci-with-jenkins-and-docker-in-docker-c3f7174ee9ff)

In order to solve the Docker 'permission denied' issue: *chmod 666 /var/run/docker.sock* (can be set at boot time with sysv-rc-conf), only for testing purposes. In detail explained [here](https://www.digitalocean.com/community/questions/how-to-fix-docker-got-permission-denied-while-trying-to-connect-to-the-docker-daemon-socket)

Maven dependencies will be downloaded to */var/jenkins_home/.m2/* which should be persisted with a Docker volume to survive container reboots.

An additional volume is needed: *$(which docker):/usr/bin/docker* to avoid the 'docker not found' error, as shown [here](https://boozallen.github.io/sdp-docs/learning-labs/1/local-development/2-run-jenkins.html).

(Pipeline) *chmod +x mvnw* as described [here](https://github.com/pascalgrimaud/generator-jhipster-docker/issues/29)

## App development

W10 VM with Git, OpenJDK 14, Node.js, Eclipse, more [here](https://www.jhipster.tech/installation)
