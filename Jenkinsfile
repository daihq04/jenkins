pipeline {
    agent any

    environment {
        DOCKER_IMAGE = 'nginx-app'
        DOCKER_REGISTRY = 'docker.io/daihq1'
        BRANCH = 'main'
        IMAGE_TAG = "${GIT_COMMIT}"
    }

    stages {
        stage('Checkout') {
            steps {
                // Lấy mã nguồn từ Git repository
                git branch: "${BRANCH}", url: 'https://github.com/daihq04/jenkins.git'
            }
        }
        stage('Build Docker Image') {
            steps {
                // Xây dựng Docker image từ Dockerfile
                script {
                    docker.build("${DOCKER_REGISTRY}/${DOCKER_IMAGE}:${IMAGE_TAG}")
                }
            }
        }
        stage('Push Docker Image') {
            steps {
                // Đẩy Docker image lên Docker Registry
                script {
                    docker.push("${DOCKER_REGISTRY}/${DOCKER_IMAGE}:${IMAGE_TAG}")
                }
            }
        }
    }

    post {
        always {
            // Dọn dẹp workspace nếu cần
            cleanWs()
        }
    }
}
