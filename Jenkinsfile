pipeline {
    agent any
    stages {
        stage('Deploy') {
            parallel {
                stage('dotnet-multiarch-test') {
                    steps {
                        sh 'make -C ./docker/dotnet-multiarch-test/ DOCKER_USER="${DOCKER_USER}" DOCKER_PASS="${DOCKER_PASS}" TAG="latest" buildpush'
                    }
                }
                stage('docker-node-multiarch-test') {
                    steps {
                        sh 'make -C ./docker/node-multiarch-test/ DOCKER_USER="${DOCKER_USER}" DOCKER_PASS="${DOCKER_PASS}" TAG="latest" buildpush'
                    }
                }
                stage('docker-nats-connector') {
                    steps {
                        sh 'make -C ./docker/nats-connector/ DOCKER_USER="${DOCKER_USER}" DOCKER_PASS="${DOCKER_PASS}" TAG="latest" buildpush'
                    }
                }
                stage('openfaas-functions') {
                    steps {
                        sh 'make -C ./faas/ FAAS_PASS="${FAAS_PASS}" FAAS_GATEWAY="${FAAS_GATEWAY}" build push deploy'
                    }
                }
                stage('helm-charts') {
                    steps {
                        sh 'echo "TODO: deploy helm images somewhere"'
                    }
                }
            }
        }
    }
}