pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                echo 'Building the project...'
                sh 'mvn clean package -DskipTests'
            }
        }

        stage('Docker Build') {
            steps {
                echo 'Building Docker image...'
                sh 'docker build -t demo-ci-cd-jenkins .'
            }
        }

        stage('Run Container') {
            steps {
                echo 'Running the container...'
                sh 'docker run demo-ci-cd-jenkins'
            }
        }
    }
}
