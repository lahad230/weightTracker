pipeline {
    agent {label 'CISlave'}
    stages {         
        stage('install docker'){
            steps{
                sh "sudo apt update"
                sh "sudo apt install apt-transport-https ca-certificates curl software-properties-common"
                sh "curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -"
                sh "sudo add-apt-repository 'deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable'"
                sh "sudo apt update"
                sh "sudo apt install docker-ce"
            }
        }       
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
