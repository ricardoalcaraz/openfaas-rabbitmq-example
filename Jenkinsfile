pipeline {
    agent any
    stages {
        stage('Deploy') {
            parallel {
                stage('docker-node-multiarch-test') {
                    steps {
                        sh 'make DOCKER_USER="${DOCKER_USER}" DOCKER_PASS="${DOCKER_PASS}" TAG="latest" buildpush'
                    }
                }
            }
        }
    }
}