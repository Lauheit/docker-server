pipeline { 
  agent any 
  environment {
        PATH = "/home/lauhe/yandex-cloud/bin/yc:${env.PATH}"
    } 
  stages {
      stage("Build and push docker images") { 
          steps {
              script {
		    def nginxTag = "lauheit/nginx:latest"
		    def apacheTag = "lauheit/apache:latest"

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
                    sh "scp -i /home/lauhe/.ssh/id_ed25519 docker-compose.yaml lauhe@158.160.22.107:/home/lauhe/server"
                    sh "ssh -i /home/lauhe/.ssh/id_ed25519 lauhe@158.160.22.107 'docker compose -f /home/lauhe/server/docker-compose.yaml pull && docker compose -f /home/lauhe/server/docker-compose.yaml up -d'"
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
