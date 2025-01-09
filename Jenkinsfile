pipeline { 
  agent any 
 
  stages {
      stage("Build and push docker images") { 
          steps {
              script {
                    def nginxTag = "cr.yandex/crpvb6onlh7bl1judmo1/nginx:${env.BUILD_NUMBER}"
                    def apacheTag = "cr.yandex/crpvb6onlh7bl1judmo1/apache:${env.BUILD_NUMBER}"

                    sh "docker build -t ${nginxTag} ./nginx"
                    sh "docker build -t ${apacheTag} ./apache"

                    sh "docker push ${nginxTag}"
                    sh "docker push ${apacheTag}"
              }
          }
      }
      stage('Deploy to Remote Server') {
            steps {
                script {
                    sh "scp docker-compose.yml user@remote-server:/home/lauhe/server"
                    sh "ssh user@remote-server 'docker-compose -f /home/lauhe/server/docker-compose.yml pull && docker-compose -f /home/lauhe/server/docker-compose.yml up -d'"
                }
            }
      }
      stage('Cleanup Docker Images') {
            steps {
                sh "docker image prune -af"
            }
      }
  }
}
