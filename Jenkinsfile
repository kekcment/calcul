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
    
    // stage('Login to Docker Hub') {      	
    //     steps{                       	
	//     sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'                 		
	//     echo 'Login Completed'      
    //     }           
    // } 

    stage('Tag image') {
      steps {
        echo 'Tag image'
        sh 'docker tag hw kekcment/hwp'

        }
    }

        stage('Push image') {
      steps {
        echo 'Push image'
        sh 'docker push kekcment/hwp'
        }
    }

}
	
    // post {
	// 	always {
	// 		sh 'docker logout'
	// 	}
	// }

}