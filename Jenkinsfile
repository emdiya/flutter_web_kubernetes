pipeline {
    agent any

    environment {
        IMAGE_NAME = 'flutter-web-kubernetes'
    }

    triggers {
        githubPush()
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/emdiya/flutter_web_kubernetes.git'
            }
        }


        stage('Build Docker Image') {
            steps {
                script {
                    // Use Jenkins build number as image tag
                    env.IMAGE_TAG = "${env.BUILD_NUMBER}"
                    sh "docker build -t flutter-web-kubernetes:${IMAGE_TAG} ."
                }
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
