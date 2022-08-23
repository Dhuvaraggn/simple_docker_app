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
        echo ${env.dockerImage}
      }
    }
    stage("push")
    {
      steps{
        echo "push image"
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
