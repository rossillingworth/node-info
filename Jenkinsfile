pipeline {

    agent any

    stages {

        stage('Info') {
            steps {
                echo "Running ${env.BUILD_ID} on ${env.JENKINS_URL}"
            }
        }

        stage('Build') {
            steps {
                sh 'mvn verify'
                sh 'cp target/node-info.war docker/contents/'
//                archiveArtifacts artifacts: '**/target/*.jar', fingerprint: true
            }
//            post{...}
        }

        stage('Docker') {
            steps {
                sh 'docker build --tag=wildfly-app .'
                sh 'oc docker push wildfly-app'
            }
        }

        stage('Update Kubernetes spec') {
            steps {
                // send a message to the deployment repo update job
            }
        }
    }

    post{
        always{
            echo "Bye"
        }
        failure{
//            mail(to: "team@example.com", subject: 'The Pipeline failed :-< ' )
        }
    }


}