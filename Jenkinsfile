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
                }
            }
            steps {
                sh 'python /app/main.py'
                sh "pytest -vvv /app"
            }
        }

        stage("Frontend Build") {
            agent {
                dockerfile {
                    dir 'sample-app/frontend'
                }
            }
            steps {
                sh "cd /app && npm run test"
            }
        }
    }
}