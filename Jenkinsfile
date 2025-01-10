pipeline {
    agent any
    environment {
        CHART_PATH = "deployments/helm-chart" // Đường dẫn đến Helm Chart trong repository mới
    }
    stages {
        stage('Clone Repository') {
            steps {
                echo 'Cloning repository...'
                git url: 'https://github.com/daihq04/jenkins.git', branch: 'main'
            }
        }
        stage('Lint Helm Chart') {
            steps {
                echo 'Running Helm Lint...'
                sh "helm lint ${CHART_PATH}"
            }
        }
        stage('Package Helm Chart') {
            steps {
                echo 'Packaging Helm Chart...'
                sh "helm package ${CHART_PATH}"
                archiveArtifacts artifacts: '*.tgz', allowEmptyArchive: false
            }
        }
        stage('Test Helm Template') {
            steps {
                echo 'Testing Helm Template...'
                sh "helm template nginx ${CHART_PATH} --debug"
            }
        }
    }
    post {
        success {
            echo 'Pipeline completed successfully!'
        }
        failure {
            echo 'Pipeline failed!'
        }
    }
}
