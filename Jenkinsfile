#!groovy

pipeline {
    agent none

    stages {
        stage('Build/Push Docker Image') {
            when {
                beforeAgent true;
                branch 'main'
            }
            agent {
                label 'linux'
            }
            environment {
                DOCKER_HUB_CREDENTIALS = credentials('docker-hub-fah16145')
            }
            stages {
                stage('Login') {
                    steps {
                        sh 'docker login -u ${DOCKER_HUB_CREDENTIALS_USR} -p ${DOCKER_HUB_CREDENTIALS_PSW}'
                    }
                }
                stage('Default Image') {
                    stages {
                        stage('Build') {
                            steps {
                                sh 'docker build -t fah16145/protonmail-bridge:latest .'
                            }
                        }
                        stage('Push') {
                            steps {
                                sh 'docker push fah16145/protonmail-bridge:latest'
                            }
                        }
                    }
                }
            }
            post {
                always {
                    sh 'docker logout'
                }
            }
        }
    }
}
