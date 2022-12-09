pipeline {
    agent {
        dockerfile {
            dir 'sample-app/backend'
        }
    }

    options {
        timeout(time: 3, unit: 'MINUTES')
    }

    stages {
        stage('Tests') {
            steps {
                sh "pytest -vvv"
            }
        }

        stage('System info') {
            steps {
                sh 'python sample-app/backend/main.py'
            }
        }
    }
}