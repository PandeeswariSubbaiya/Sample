pipeline {
    agent any
    
    environment {
        GIT_BRANCH = "release"
        GIT_REPO = "https://github.com/PandeeswariSubbaiya/Sample.git"
    }
    
    stages {
        stage('Clone repository') {
            steps {
                checkout([$class: 'GitSCM', 
                          branches: [[name: "${env.GIT_BRANCH}"]],
                          userRemoteConfigs: [[url: "${env.GIT_REPO}"]]])
            }
        }
     stage('Merge to main') {
            steps {
                sh """
                git checkout main
                git merge ${env.GIT_BRANCH}
                git push -u origin main
                """
            }
        }
    }
    
    post {
        success {
            echo 'Changes merged successfully!'
        }
        failure {
            echo 'Failed to merge changes!'
        }
    }
}
