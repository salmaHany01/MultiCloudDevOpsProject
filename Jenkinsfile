pipeline {
    agent any

    environment {
        
        GITHUB_REPO = "salmaHany01/MultiCloudDevOpsProject"
        imageNameapp = "${DOCKER_REGISTRY}:${imageTagApp}"
        imageTagApp = "build-${BUILD_NUMBER}-app"
        DOCKER_REGISTRY = "salmahany3010"
        DOCKER_IMAGE = "spring-boot"
        OPENSHIFT_SERVER = 'https://api.ocpuat.devopsconsulting.org:6443'
        OPENSHIFT_PROJECT = 'salmahany'
        APP_PORT = '8080'
        APP_SERVICE_NAME = 'spring-boot'
        APP_HOST_NAME = 'springboot.apps.ocpuat.devopsconsulting.org'
        
    }

    stages {
        
        stage('Checkout') {
            steps {
                git url: "https://github.com/${GITHUB_REPO}.git", branch: 'main'
            }
        }
        
        stage('Unit Test') {
            steps {
                sh "chmod +x ./gradlew"
                
                sh "./gradlew test --stacktrace"
            }
        }
        stage('SonarQube Analysis') {
            withSonarQubeEnv() {

                sh "./gradlew sonar"
                
            }
        }
        
        stage('Build Docker Image') {
            steps {
                    
                sh "chmod +x gradlew"
                    
                sh "docker build -t ${imageNameapp} ."
                
                sh "docker tag ${imageNameapp} docker.io/${DOCKER_REGISTRY}/${DOCKER_IMAGE}:${imageTagApp}"
               
            }
        }
        
        stage('Push Image to DockerHub') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'jenkins-docker', usernameVariable: 'DOCKER_REGISTRY_USERNAME', passwordVariable: 'DOCKER_REGISTRY_PASSWORD')]) {
                   
                    sh "echo \${DOCKER_REGISTRY_PASSWORD} | docker login -u \${DOCKER_REGISTRY_USERNAME} --password-stdin"
                    
                    sh "docker push docker.io/${DOCKER_REGISTRY}/${DOCKER_IMAGE}:${imageTagApp}"
                    
                }
            }
        }
        
        stage('Deploy to OpenShift') {
            steps {
                script {
                    withCredentials([string(credentialsId: 'openshift-login-token', variable: 'OPENSHIFT_SECRET')]) {
                       sh "oc login --token=\${OPENSHIFT_SECRET} --server=\${OPENSHIFT_SERVER} --insecure-skip-tls-verify"
                    }
                    sh "oc project \${OPENSHIFT_PROJECT}"
                    sh "oc delete dc,svc,deploy,ingress,route \${DOCKER_IMAGE} || true"
                    sh "oc new-app ${DOCKER_REGISTRY}/${DOCKER_IMAGE}:${imageTagApp} --token=\${OPENSHIFT_SECRET}"
                    sh "oc expose service/${APP_SERVICE_NAME}"
                }
            }
        }
    }
}
