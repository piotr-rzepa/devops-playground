pipeline {
    agent any

    options {
        timeout(time: 3, unit: 'MINUTES')
    }

    stages {
        stage('Build') {
            steps {
                echo 'Inside build stage'
                sh 'ls -lh'
            }
        }
    }
}