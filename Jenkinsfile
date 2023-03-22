node {
  // Define Maven tool
  def mvnHome = tool 'maven3'

  // Define branch name
  def branchName = env.GIT_BRANCH

  // Checkout Git repository
  if (branchName.contains('main')) {
    echo 'Hello from main branch'
    git branch: 'main', url: 'https://github.com/PandeeswariSubbaiya/Sample.git'
  } else {
    echo "Run this stage only if the branch is not main"
    git branch: 'release', url: 'https://github.com/PandeeswariSubbaiya/Sample.git'
  }

  // Compile the project
  stage('Compile') {
    // Run Maven command
    sh "${mvnHome}/bin/mvn clean package"
  }
}
