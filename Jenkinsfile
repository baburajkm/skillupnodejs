pipeline {
  agent any
  environment {
    IMAGE_NAME = "nodejs-app"
    DOCKER_HUB_REPO = "baburaj50/${IMAGE_NAME}"
  }
  stages {
    stage('Checkout Code') {
      steps {
        git url: 'https://github.com/<your-github-username>/skillupnodejs.git', branch: 'main'
      }
    }
    stage('Build Docker Image') {
      steps {
        sh 'docker build -t $IMAGE_NAME .'
      }
    }
    stage('Push to Docker Hub') {
      steps {
        withDockerRegistry(credentialsId: 'docker_hub_credentials', url: '') {
          sh 'docker tag $IMAGE_NAME $DOCKER_HUB_REPO:latest'
          sh 'docker push $DOCKER_HUB_REPO:latest'
        }
      }
    }
    stage('Deploy to Kubernetes') {
      steps {
        sh 'kubectl apply -f k8s-deployment.yaml'
      }
    }
  }
}
