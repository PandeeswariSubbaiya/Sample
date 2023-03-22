pipeline {
    agent any
    tools {
        maven 'maven3'
    }
    environment{
      def mvnHome =  tool name: 'maven3', type: 'maven' 
      def BRANCH_NAME ='GIT_BRANCH'
  }
stages {
      stage('GIT checkout') {
           steps {
               script{
                   if (env.GIT_BRANCH.contains('main')) {
                echo 'Hello from main branch'
                git branch: 'main', url: 'https://github.com/PandeeswariSubbaiya/Sample.git'
                }
               else {
                   echo "Run this stage only if the branch is not main"
                  git branch: 'release', url: 'https://github.com/PandeeswariSubbaiya/Sample.git' 
               }
               }
          }
        }
       stage('Compile') {
           steps {
            sh 'pwd'
            sh 'ls -la'
            sh 'mvn -f /var/lib/jenkins/workspace/Branching_Strategies/pom.xml clean package'
            sh "${mvnHome}/bin/mvn clean package"
            }
        }
    }
}
