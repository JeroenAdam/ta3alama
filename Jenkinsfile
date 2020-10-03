#!/usr/bin/env groovy

node {
    properties(
    [
        buildDiscarder(
            logRotator(
                numToKeepStr: '2'
            )
        ),
        disableConcurrentBuilds()
    ]
    )
    
    stage('checkout') {
        checkout scm
    }

    docker.image('jhipster/jhipster:v6.10.3').inside('-u jhipster -e MAVEN_OPTS="-Duser.home=./"') {
        stage('check java') {
            sh "java -version"
        }

        stage('clean') {
            sh "chmod +x mvnw"
            sh "./mvnw -ntp clean -P-webpack"
        }
        stage('nohttp') {
            sh "./mvnw -ntp checkstyle:check"
        }

        stage('install tools') {
            sh "./mvnw -ntp com.github.eirslett:frontend-maven-plugin:install-node-and-npm -DnodeVersion=v12.16.1 -DnpmVersion=6.14.5"
        }

        stage('npm install') {
            sh "./mvnw -ntp com.github.eirslett:frontend-maven-plugin:npm"
        }

        stage('build + backend tests + sonar') {
          //inserted SonarQube here for speed gain  
          withSonarQubeEnv('SonarQube') {
            try {
                //sh "./mvnw -ntp verify -P-webpack"
                sh "./mvnw -ntp verify -Pprod sonar:sonar"
            } catch(err) {
                throw err
            } finally {
                junit '**/target/test-results/**/TEST-*.xml'
            }
          }
        }

        stage('frontend tests') {
            try {
               sh "./mvnw -ntp com.github.eirslett:frontend-maven-plugin:npm -Dfrontend.npm.arguments='run test'"
            } catch(err) {
                throw err
            } finally {
                junit '**/target/test-results/**/TEST-*.xml'
            }
        }

        //stage('packaging') {
            //sh "./mvnw -ntp verify -P-webpack -Pprod -DskipTests"
            //archiveArtifacts artifacts: '**/target/*.jar', fingerprint: true
        //}
        
        //stage('quality analysis') {
            //withSonarQubeEnv('SonarQube') {
                //sh "./mvnw -ntp initialize sonar:sonar"
            //}
        //}
    }

    def dockerImage
    stage('publish docker') {
            docker.withRegistry('https://10.0.0.4', 'PrivateRegistry') {
            def customImage = docker.build("10.0.0.4/private/ta3alama:latest")            
            customImage.push()
            sh 'docker system prune -a --volumes -f --filter "label=ta3alama"'
            } 
    }
}
