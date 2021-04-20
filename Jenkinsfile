pipeline {
    agent {'staging'}
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
            sh 'ip=$(curl https://ipinfo.io/ip)\n\
                echo "# Host configuration\n\
                PORT=8080\n\
                HOST=0.0.0.0\n\
                NODE_ENV=development\n\
                HOST_URL=http://$ip:8080\n\
                COOKIE_ENCRYPT_PWD=superAwesomePasswordStringThatIsAtLeast32CharactersLong!\n\
                # Okta configuration\n\
                OKTA_ORG_URL=https://$okta_url\n\
                OKTA_CLIENT_ID=$okta_id\n\
                OKTA_CLIENT_SECRET=$okta_secret\n\
                # Postgres configuration\n\
                PGHOST=$db_fqnd\n\
                PGUSERNAME=$db_user\n\
                PGDATABASE=postgres\n\
                PGPASSWORD=$db_password\n\
                PGPORT=5432" > .env"'
        }
        stage('Deploy'){
            build job: 'weightCI'
        }
    }
}
