pipeline {
  
  agent {
    docker {
        image 'kekcment/tom:0.1.1'
        args '--privileged -v /var/run/docker.sock:/var/rundocker.sock'
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
    
    stage('Make docker image') {
      steps {
        sh 'docker build - t hw -f Dockerfile .' 
        sh 'docker tag hw kekcment/hw:latest'
        withDockerRegistry([ credentialsId: "docker-hub-credentials", url: ""]) {
            bat "docker push kekcment/hw:latest"
        }
      }
    }
    
    stage('Run docker on Slave1 (158.160.27.233)') {
      steps {
        echo 'Run docker on Slave1'
      }
    }
    
}
}