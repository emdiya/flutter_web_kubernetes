pipeline {
    agent any

    environment {
        IMAGE_NAME = 'flutter-web-kubernetes'
    }

    triggers {
        githubPush() // Auto-trigger on GitHub push
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/emdiya/flutter_web_kubernetes.git'
            }
        }

        stage('Build Docker Image') {
            when {
                branch 'main'
            }
            steps {
                sh 'docker build -t $IMAGE_NAME .'
            }
        }

        stage('Load Docker Image into kind') {
            when {
                branch 'main'
            }
            steps {
                sh 'kind load docker-image $IMAGE_NAME'
            }
        }

        stage('Deploy to Kubernetes') {
            when {
                branch 'main'
            }
            steps {
                sh 'kubectl apply -f deployment.yaml'
            }
        }
    }
}
