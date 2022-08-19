pipeline {
  agent any
  stages {
    stage("build")
    {
      steps{
        echo 'building the application'
        nodejs('node-18-7')
        {
          sh 'npm -v'
          sh 'angular -v'
        }
      }
    }
    stage("test")
    {
        steps
        {
            echo 'testing the application'
        }
    }
    stage("deploy")
    {
        steps {
            echo 'deploying the application'
        }
    }
    }
}
