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
    
    stage('Tag image') {
      steps {
        echo 'Tag image'
        sh 'docker tag hw kekcment/hw'

        }
    }

    stage('Push image') {
      steps {
        echo 'Push image'
        sh 'docker push kekcment/hw'
        }
    }

    stage ('Deploy on slave1') {
    steps{
        // sshagent(credentials : ['22c3000e-397e-46e4-8452-ca14cbc819e1']) {
            sh """ssh -t root@51.250.24.252 << EOF 
                docker pull kekcment/hw 
                docker run -d -p 8088:8080 kekcment/hw
                exit
                EOF"""
            // sh 'docker pull kekcment/hw '
            // sh 'docker run -d -p 8088:8080 kekcment/hw'
        // }
    }
}

}
}