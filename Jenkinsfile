pipeline {
    agent any

    environment {
        IMAGE_NAME = "django-todo"
        IMAGE_TAG = "v1.0"
        
    }

    stages {
        stage('Checkout Code') {
            steps {
                git url: 'https://github.com/keerthanamahadasyam/docker-learning.git', branch: 'main'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    // Print current dir and files for debugging (optional)
                    sh 'pwd && ls -la'

                    // Build the Docker image from current directory
                    sh "docker build -t ${IMAGE_NAME}:${IMAGE_TAG} ."
                }
            }
        }

        stage('Run Docker Container') {
            steps {
                script {
                    // Stop and remove any existing container with the same name
                    sh "docker stop ${IMAGE_NAME} || true"
                    sh "docker rm ${IMAGE_NAME} || true"

                    // Run the container on port 8080 -> 80
                    sh "docker run -d --name ${IMAGE_NAME} -p 8001:81 ${IMAGE_NAME}:${IMAGE_TAG}"
                }
            }
        }
    }
}
