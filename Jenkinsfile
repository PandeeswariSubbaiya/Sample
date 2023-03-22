pipeline {
    agent any
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
        def mvnHome = tool name: 'maven3', type: 'maven'
        withEnv(["MVN_HOME=${mvnHome}"]) {
            sh '${MVN_HOME}/bin/mvn clean package'
        }
    }
}
}
