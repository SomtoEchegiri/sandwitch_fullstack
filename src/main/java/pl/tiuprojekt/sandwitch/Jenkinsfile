pipeline {
    agent any  // Runs on any available agent

    environment {
        DOCKER_REGISTRY = "your-dockerhub-username"
        BACKEND_IMAGE = "sandwitch-backend"
    }

    stages {
        stage('Checkout Code') {
            steps {
                git branch: 'main', url: 'https://github.com/SomtoEchegiri/sandwitch_fullstack.git'
            }
        }

        stage('Build with Maven') {
            steps {
                dir('backend') { 
                    sh 'mvn clean package -DskipTests' 
                }
            }
        }

        stage('Run Unit Tests') {
            steps {
                dir('backend') { 
                    sh 'mvn test' 
                }
            }
        }

        stage('Build Docker Image') {
            steps {
                sh "docker build -t $DOCKER_REGISTRY/$BACKEND_IMAGE:latest ./backend"
            }
        }

        stage('Push Docker Image') {
            steps {
                withDockerRegistry([credentialsId: 'docker-hub-credentials', url: '']) {
                    sh "docker push $DOCKER_REGISTRY/$BACKEND_IMAGE:latest"
                }
            }
        }

        stage('Deploy Container') {
            steps {
                sh "docker run -d -p 8080:8080 --name backend --rm $DOCKER_REGISTRY/$BACKEND_IMAGE:latest"
            }
        }
    }

    post {
        success {
            echo 'Backend deployment successful!'
        }
        failure {
            echo 'Pipeline failed. Check logs for details.'
        }
    }
}
