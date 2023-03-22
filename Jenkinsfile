node {
    def mvnHome = tool 'maven3'
    def BRANCH_NAME = env.GIT_BRANCH

    stage('GIT checkout') {
        if (BRANCH_NAME.contains('main')) {
            echo 'Hello from main branch'
            git branch: 'main', url: 'https://github.com/PandeeswariSubbaiya/Sample.git'
        } else {
            echo "Run this stage only if the branch is not main"
            git branch: 'release', url: 'https://github.com/PandeeswariSubbaiya/Sample.git'
        }
    }

    stage('Compile') {
        sh "${mvnHome}/bin/mvn clean package"
    }
}
