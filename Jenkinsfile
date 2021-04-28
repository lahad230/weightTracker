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
        // stage('run staging playbook'){
        //     steps{
        //         sh 'ansible-playbook staging.yml --extra-vars "url=${okta_url} id=${okta_id} secret=${okta_secret} db_host=${db_fqnd} pass=${db_password} user=${db_user} username=${username} api_key=${api_key}"'            
        //     }
        // }
        // stage('run prod playbook'){
        //     input {
        //         message "Should we deploy to production?"
        //     }
        //     steps{
        //         sh 'ansible-playbook prod.yml --extra-vars "url=${okta_url} id=${prod_id} secret=${prod_secret} db_host=${prod_host} pass=${db_password} user=${db_user} username=${username} api_key=${api_key}"'            
        //     }
        // }
    }
}
