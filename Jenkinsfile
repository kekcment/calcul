pipeline {
  
  agent {
    docker {
        image 'kekcment/tom:0.1.1'
        args '--privileged -v /var/run/docker.sock:/var/run/docker.sock'
    }
  }   

  	environment {
		DOCKERHUB_CREDENTIALS=credentials('fd092a3d-6b54-4fdb-bfcf-7e8c2e818872')
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

    stage('Copy War') {
      steps {
        echo 'Copy War'
        sh 'mkdir /tmp/calc && cp ./target/mycalcwebapp.war /tmp/calc'
      }
    }

    stage('ShoW file War') {
      steps {
        echo 'ShoW file War'
        sh 'cd /tmp/calc'
        sh 'ls /tmp/calc'
      }
    }
    
    stage('Make docker image') {
      steps {
        echo 'Build image'
        sh 'docker build -t hw .'          
        }
      }
    

    stage('Tag and push image') {
      steps {
        echo 'Tag and push image'
        sh 'docker tag hw kekcment/hw:latest'
        sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
        sh 'docker push kekcment/hw:latest'
    }
    }
}
	
    post {
		always {
			sh 'docker logout'
		}
	}

}