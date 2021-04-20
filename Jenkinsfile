pipeline {
    agent {label 'staging'}
    stages {
        stage('Build dependencies') { 
            steps {
                sh "curl -fsSL https://deb.nodesource.com/setup_15.x | sudo -E bash -"
                sh "sudo apt-get install -y nodejs"
                sh "sudo npm install pm2 -g"
                sh "sudo npm install cjs"
            }
        }
        stage('Build env') {
            steps {
                sh "bash buildEnv.sh -u ${okta_url} -i ${okta_id} -s ${okta_secret} -h ${db_fqnd} -p ${db_password} -n ${db_user}"
            }
        }
        stage('Deploy'){
            steps{
                sh "sudo pm2 start src/index.js"
                sh "sudo pm2 save"
                sh "sudo pm2 startup"
            }
        }
    }
}
