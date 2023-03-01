pipeline {
  
  agent {
    docker {
        image 'kekcment/tom:0.1.1'
        args '--privileged -v /var/run/docker.sock:/var/run/docker.sock'
    }
  }   

  	environment {
		DOCKERHUB_CREDENTIALS=credentials('dockerhub')
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

    // stage('Show file War') {
    //   steps {
    //     echo 'ShoW file War'
    //     sh 'cd /tmp/calc'
    //     sh 'ls /tmp/calc'
    //   }
    // }
    
    stage('Make docker image') {
      steps {
        echo 'Build image'
        sh 'docker build -t hw .'          
        }
      }
    
    stage('Login to Docker Hub') {      	
        steps{                       	
	    // sh 'docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
        docker.withRegistry('https://hub.docker.com', 'dockerhub') {
            sh 'docker tag hw kekcment/hw:latest'
            sh 'docker push kekcment/hw:latest'
            }                		
	    echo 'Login Completed'      
        }           
    } 

    stage('Tag and push image') {
      steps {
        echo 'Tag and push image'
        sh 'docker tag hw kekcment/hw:latest'
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