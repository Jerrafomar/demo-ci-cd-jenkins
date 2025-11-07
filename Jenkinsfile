pipeline {
    agent any

    environment {
        IMAGE_NAME = "demo-ci-cd-jenkins"
        CONTAINER_NAME = "demo-ci-cd-jenkins-container"
    }

    stages {

        stage('Build') {
            steps {
                echo 'Building the Maven project...'
                sh 'mvn clean package -DskipTests'
            }
        }

        stage('Docker Build') {
            steps {
                echo '🐳 Building Docker image...'
                sh 'docker build -t ${IMAGE_NAME} .'
            }
        }

        stage('Run Container') {
            steps {
                echo 'Running Docker container...'
                sh '''
                    docker rm -f ${CONTAINER_NAME} || true
                    docker run -d --name ${CONTAINER_NAME} ${IMAGE_NAME}
                '''
            }
        }

    }

    post {
        success {
            echo 'Build and deployment successful!'
            sh 'docker ps | grep ${CONTAINER_NAME} || true'
        }
        failure {
            echo 'Build failed. Check logs above.'
        }
    }
}
