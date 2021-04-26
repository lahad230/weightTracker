pipeline {
    agent {label 'CISlave'}
    stages {                
        stage('Build dependencies') { 
            steps {
                sh "curl -fsSL https://deb.nodesource.com/setup_15.x | sudo -E bash -"
                sh "sudo apt-get install -y nodejs"
                sh "sudo npm install cjs"
            }
        }
        stage('package'){
            steps{
                //zip zipFile: "${BUILD_NUMBER}.zip", exclude: "*.zip"
                zip zipFile: "latest.zip", exclude: "*.zip", overwrite: true
                archiveArtifacts artifacts: "latest.zip", followSymlinks: false
            }
        }
    }
}
