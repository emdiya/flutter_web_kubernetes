pipeline {
    agent any

    tools {
        git 'Default'
    }

    environment {
        IMAGE_NAME = 'flutter-web-kubernetes'
        PATH = "$PATH:/tmp/workspace/flutter/bin"
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

         stage('Flutter Docker') {
            steps {
                sh "flutter doctor -v"
            }
        }      

        stage('Flutter Clean & Flutter Pubget') {
            steps {
                sh 'flutter clean && flutter pub get'
            }
        }

        stage('Build Flutter Web') {
            steps {
                sh 'flutter build web'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    env.IMAGE_TAG = "${env.BUILD_NUMBER}"
                    env.FULL_IMAGE_NAME = "${IMAGE_NAME}:${IMAGE_TAG}"
                }
                sh "docker build -t ${env.FULL_IMAGE_NAME} ."
            }
        }

        stage('Load Docker Image into kind') {
            steps {
                sh "kind load docker-image ${env.FULL_IMAGE_NAME}"
            }
        }

        stage('Deploy to Kubernetes') {
            steps {
                sh 'kubectl apply -f deployment.yaml'
            }
        }
    }
}
