pipeline {
    agent none

    options {
        timeout(time: 15, unit: 'MINUTES')
    }

    environment {
        CI = "true"
    }

    stages {
        stage('Backend Build') {
            agent {
                dockerfile {
                    dir 'sample-app/backend'
                    additionalBuildArgs '-t backend'
                    reuseNode true
                }
            }
            steps {
                script {
                    sh 'python /app/main.py'
                    sh "pytest -vvv /app"
                }
            }
        }

        stage("Frontend Build") {
            agent {
                dockerfile {
                    dir 'sample-app/frontend'
                    additionalBuildArgs '-t frontend'
                    reuseNode true
                }
            }
            steps {
                sh "cd /app && npm run test"
            }
        }

        stage("Test Dive") {
            agent any
            steps {
                script {
                    def frontendImage = docker.build("frontend", "./sample-app/frontend")
                    def backendImage = docker.build("backend", "./sample-app/backend")
                    docker.image("wagoodman/dive:latest").inside("-u 0:0 -e CI=$CI --entrypoint='' -v /var/run/docker.sock:/var/run/docker.sock") {
                        sh "dive --version"
                        sh "dive frontend"
                        sh "dive backend"
                    }
                }
            }
        }
    }
}