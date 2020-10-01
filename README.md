[![Build Status](https://build.adambahri.com/buildStatus/icon?job=ta3alama)](https://build.adambahri.com/job/ta3alama/)
# ta3alama

This demo application was generated using [JHipster](https://www.jhipster.tech).
Some of the used technologies: [Java](https://openjdk.java.net), [Spring Boot](https://spring.io/projects/spring-boot), [Elasticsearch](https://github.com/elastic/elasticsearch), [SonarQube](https://www.sonarsource.com/java/). You can see the pom.xml for more details.
This repository serves as a sandbox environment for my personal CI/CD (Continuous Integration/Continuous Deployment) pipeline consisting of:
 * [Jenkins](https://jenkins.io) (build server)
 * Protractor end-to-end testing (I plan on using [Cypress](https://www.cypress.io) in the future)
 * [Docker](https://www.docker.com) (Docker-in-Docker approach)
 * [Harbor](https://goharbor.io) (self-hosted Docker registry)
 * [Watchtower](https://github.com/containrrr/watchtower) (watching for updated Docker image, updating running container)

I'm using this DevOps workflow while coding my first large project, a [Java webapp - Content sharing platform](https://github.com/JeroenAdam/Content-sharing-platform).
Later on, I'll launch a self-hosted [RocketChat](https://rocket.chat) server for team collaboration, and maybe open-source the project so that more people can join.
Build Status (on top of this readme) is only available when my laptop is online since my build server is running locally.

## Development

W10 VM with Git, OpenJDK 14, Node.js, Eclipse https://www.jhipster.tech/installation
