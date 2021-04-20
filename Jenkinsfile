pipeline {
    agent {label 'CISlave'}
    stages {
        stage('Build env') {
            steps {
                sh "bash buildEnv.sh -u ${okta_url} -i ${okta_id} -s ${okta_secret} -h ${db_fqnd} -p ${db_password} -n ${db_user}"
            }
        }
        stage('package'){
            steps{
                zip zipFile: "${BUILD_NUMBER}.zip", exclude: "*.zip"
                zip zipFile: "latest.zip", exclude: "*.zip", overwrite: true
                archiveArtifacts artifacts: "${BUILD_NUMBER}.zip, latest.zip", followSymlinks: false
            }
        }
    }
}
