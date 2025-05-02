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
                    // Tag the image with build number
                    env.IMAGE_TAG = "${env.BUILD_NUMBER}"
                    env.FULL_IMAGE_NAME = "${IMAGE_NAME}:${IMAGE_TAG}"
                    sh "docker build -t ${FULL_IMAGE_NAME} ."
                }
            }
        }

        stage('Load Docker Image into kind') {
            steps {
                sh "kind load docker-image ${FULL_IMAGE_NAME}"
            }
        }

        stage('Deploy to Kubernetes') {
            steps {
                
                sh 'kubectl apply -f deployment.yaml'
            }
        }
    }
}
