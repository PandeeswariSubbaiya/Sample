pipeline {
    agent any
    tools { 
        maven 'maven3' 
           }
    environment{
      def BRANCH_NAME ='GIT_BRANCH'
  }
stages {
      stage('GIT checkout') {
           steps {
               script{
                   if (env.GIT_BRANCH.contains('main')) {
                echo 'Hello from main branch'
                git branch: 'main', url: 'https://github.com/PandeeswariSubbaiya/ansible_tomcat.git'
                }
               else {
    //        sh echo 'Hello from ${env.BRANCH_NAME} branch!'"
     //              echo 'Hello from ${env.BRANCH_NAME} branch!
                   echo "Run this stage only if the branch is not main"
                  git branch: 'dev', url: 'https://github.com/PandeeswariSubbaiya/ansible_tomcat.git' 
               }
               }
          }
        }
       stage('Compile') {
           steps {
               sh 'mvn clean test package'
            }
        }
    }
}
