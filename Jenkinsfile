pipeline {
    agent any
    stages {
        stage('Deploy') {
            parallel {
                stage('dotnet-multiarch-test') {
                    steps {
                        sh 'make DOCKER_USER="${DOCKER_USER}" DOCKER_PASS="${DOCKER_PASS}" TAG="latest" buildpush'
                    }
                }
                stage('docker-node-multiarch-test') {
                    steps {
                        sh 'make DOCKER_USER="${DOCKER_USER}" DOCKER_PASS="${DOCKER_PASS}" TAG="latest" buildpush'
                    }
                }
                stage('openfaas-functions') {
                    steps {
                        sh 'make -C ./faas/ FAAS_PASS="${FAAS_PASS}" FAAS_GATEWAY="${FAAS_GATEWAY}" build push deploy'
                    }
                }
            }
        }
    }
}