pipeline {
    agent any

    environment {
        IMAGE_NAME = 'flutter-web-kubernetes'
    }

    stages {
        stage('Checkout') {
            steps {
                git 'https://github.com/emdiya/flutter_web_kubernetes.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t $IMAGE_NAME .'
            }
        }

        stage('Load Docker Image into kind') {
            steps {
                sh 'kind load docker-image $IMAGE_NAME'
            }
        }

        stage('Deploy to Kubernetes') {
            steps {
                sh 'kubectl apply -f deployment.yaml'
            }
        }
    }
}
