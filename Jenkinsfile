pipeline {
    agent any
    // environment {
    //     taskversion = '10'
    // }
    stages{
        stage('checkout scm'){
            steps{
                checkout([$class: 'GitSCM', branches: [[name: '*/feature-1']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/Dhuvaraggn/simple_docker_app']]])
            }
        }
        stage('build image'){
            steps{
                script{
                    def dockerimage=docker.build("jenkins-training")
                }
            }
        }
        stage('push'){
            steps{
                script{
                    sh 'aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 877969058937.dkr.ecr.us-east-1.amazonaws.com'
                    sh 'docker tag jenkins-training:latest 877969058937.dkr.ecr.us-east-1.amazonaws.com/jenkins-training:latest'
                    sh 'docker push 877969058937.dkr.ecr.us-east-1.amazonaws.com/jenkins-training:latest'
                }
            }
        }
        stage('deploy')
        {
            steps{
                script{
                    sh('aws --version')
                    sh('aws ecs register-task-definition --region us-east-1 --family devops-training --execution-role-arn arn:aws:iam::877969058937:role/ecsTaskExecutionRole --requires-compatibilities FARGATE --network-mode awsvpc --cpu 256 --memory 512 --container-definitions file://taskdef.json')
                    env.taskversion = sh(script: 'aws ecs describe-task-definition --task-definition devops-training | egrep revision | awk \'{print \$2}\' | sed \'s/,//\'',returnStdout: true)
                    echo env.taskversion
                    sh('aws ecs update-service --cluster devops-training --service devops-training --task-definition devops-training:'+env.taskversion)
                }
            }
        }
        // stage('push image'){
        //     steps{
        //         script{
        //             docker.withRegistry("https://877969058937.dkr.ecr.us-east-1.amazonaws.com","aws-cred"){
        //                 dockerimage.push('latest')
        //             }
        //         }
        //     }
        // }
    }
}