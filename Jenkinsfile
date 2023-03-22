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
                        echo "Run this stage only if the branch is not main"
                        git branch: 'release', url: 'https://github.com/PandeeswariSubbaiya/ansible_tomcat.git' 
               }
               }
          }
        }
       stage('Compile') {
           steps {
               def mvnHome =  tool name: 'maven3', type: 'maven'  
                sh "${mvnHome}/bin/mvn clean package"
            }
        }
    }
}
