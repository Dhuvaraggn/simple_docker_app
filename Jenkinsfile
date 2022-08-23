pipeline{
   agent any
  environment
  {
    dockerImage = "jenkins-training"
  }
  stages {
    stage("build")
    {
      steps{
        echo "build started"
        echo "${env.dockerImage}"
        script {
          dockerApp = docker.build("jenkins-training")
        }
      }
    }
    stage("push")
    {
      steps{
        echo "push image"
        script{
          docker.withRegistry("877969058937.dkr.ecr.us-east-1.amazonaws.com/jenkins-training:latest"){
            dockerApp.push("latest")
          }
        }
      }
    }
    stage("deploy")
    {
      steps{
        echo "deploy docker"
        
      }
    }
  }
}
