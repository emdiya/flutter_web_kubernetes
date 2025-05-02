pipeline {
    agent any

    tools {
        git 'Default'
    }

    environment {
        IMAGE_NAME = 'flutter-web-kubernetes'
        PATH = "${env.PATH}:${env.WORKSPACE}/flutter/bin"
    }

    triggers {
        githubPush()
    }

    stages {
        stage('Install Flutter SDK') {
            steps {
                sh '''
                # Only clone if not already present
                if [ ! -d "flutter" ]; then
                  git clone https://github.com/flutter/flutter.git -b stable
                fi

                # Pre-cache Flutter dependencies
                export PATH="$PATH:$PWD/flutter/bin"
                flutter doctor
                '''
            }
        }

        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/emdiya/flutter_web_kubernetes.git'
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
