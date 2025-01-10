pipeline {
    agent any
    environment {
        DOCKER_IMAGE = 'daihq1/nginx-app:v1'
    }
    stages {
        stage('Clone Repository') {
            steps {
                git branch: 'main', url: 'https://github.com/daihq04/jenkins.git'
            }
        }
        stage('Build Docker Image') {
            steps {
                sh 'docker build -t $DOCKER_IMAGE .'
            }
        }
        stage('Push Docker Image') {
            steps {
                sh 'docker login -u daihq1 -p Abc@123456'
                sh 'docker push $DOCKER_IMAGE'
            }
        }
    }
}
