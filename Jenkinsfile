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
     
    stage('clean') {
        sh "chmod +x mvnw"
        sh "./mvnw -ntp clean"
    }
    
    stage('nohttp') {
        sh "./mvnw -ntp checkstyle:check"
    }

    stage('install tools') {
        sh "./mvnw -ntp com.github.eirslett:frontend-maven-plugin:install-node-and-npm -DnodeVersion=v12.13.0 -DnpmVersion=6.13.0"
    }

    stage('npm install') {
        sh "./mvnw -ntp com.github.eirslett:frontend-maven-plugin:npm"
    }

    stage('build + Sonar + backend tests') {
        try {
            sh "./mvnw -ntp verify -Pprod sonar:sonar"
        } catch(err) {
            throw err
        } finally {
            junit '**/target/test-results/**/TEST-*.xml'
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
    
    //building artifact skipped because already done during build stage
    //stage('packaging') {
    //    sh "./mvnw -ntp verify -Pprod -DskipTests"
    //    archiveArtifacts artifacts: '**/target/*.jar', fingerprint: true
    //}
    
    docker.image('jhipster/jhipster:v6.5.1').inside('-u jhipster -e MAVEN_OPTS="-Duser.home=./"') {
                      
        stage('docker build+push') {
            //docker.withRegistry('https://ljytvavc.gra5.container-registry.ovh.net', 'OVHPrivateRegistry') {
            //def customImage = docker.build("ljytvavc.gra5.container-registry.ovh.net/private/ta3alama:latest")
            docker.withRegistry('https://10.0.0.4', 'PrivateRegistry') {
            def customImage = docker.build("10.0.0.4/private/ta3alama:latest")                
            customImage.push()
            sh 'docker system prune -a --volumes -f --filter "label!=openjdk"'
            sh 'docker system prune -a --volumes -f --filter "label=ta3alama"'    
            } 
        }   
    }
    try {
        stage('send mail') {
            //mail to: 'info@adambahri.com',
            //subject: "Successful Pipeline: ${currentBuild.fullDisplayName}",
            //body: "Successful build completed: ${env.BUILD_URL}"

        }
    } finally {
            //sh "java --version"
    
    }
    
}
