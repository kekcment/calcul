pipeline {
  
  agent {
    docker {
        image 'kekcment/tom:0.1.1'
    }
  }      

  stages {
      
    stage('Copy source from git') {
      steps {
        echo 'git clone'
        git 'https://github.com/kekcment/calcul.git'
      }
    }    
    
    stage('Build War') {
      steps {
        echo 'Build War'
        sh 'mvn package'
      }
    }
        stage('Run docker)') {
      steps {
        sh 'docker run -v /var/run/docker.sock:/var/run/docker.sock -ti docker'
      }
    }
    
    stage('Run docker on Slave1 (158.160.27.233)') {
      steps {
        echo 'Run docker on Slave1'
      }
    }
    
}
}