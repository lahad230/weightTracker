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
                sh "ip=${(curl https://ipinfo.io/ip)}"
                sh "echo '# Host configuration\nPORT=8080\nHOST=0.0.0.0\nNODE_ENV=development\nHOST_URL=http://$ip:8080\nCOOKIE_ENCRYPT_PWD=superAwesomePasswordStringThatIsAtLeast32CharactersLong!\n# Okta configuration\nOKTA_ORG_URL=https://$okta_url\nOKTA_CLIENT_ID=$okta_id\nOKTA_CLIENT_SECRET=$okta_secret\n# Postgres configuration\nPGHOST=$db_fqnd\nPGUSERNAME=$db_user\nPGDATABASE=postgres\nPGPASSWORD=$db_password\nPGPORT=5432' > .env"
            }
        }
        stage('Deploy'){
            steps{
                build job: 'weightCI'
            }
        }
    }
}
