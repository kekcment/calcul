pipeline {
  
  agent {
    docker {
        image 'kekcment/tom:0.1.1'
        args '--privileged -v /var/run/docker.sock:/var/run/docker.sock'
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

    // stage('Copy War') {
    //   steps {
    //     echo 'Build War'
    //     sh 'cp target/mycalcwebapp.war /var/webapp'
    //   }
    // }
    
    stage('Make docker image') {
      steps {
        echo 'Build image'
        sh 'docker build -t hw -f Dockerfile .'        
        }
      }
    

    stage('Tag and push image') {
      steps {
        echo 'Tag and push image'
        sh 'docker tag hw kekcment/hw:latest'
        withDockerRegistry([ 'https://registry.hub.docker.com', 'Dockerhub']) {
            bat "docker push kekcment/hw:latest"
      }
    }
    }

    
}
}