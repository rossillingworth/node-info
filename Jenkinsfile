pipeline {

    //
    // use agent or node to choose the slave
    // agent can be embedded into a stage,
    // while node uses {...} and anything inside runs as specified
    //
    agent {
        label "maven"
    }

    stages {

        stage('Info') {
            steps {
                echo "Running ${env.BUILD_ID} on ${env.JENKINS_URL}"
                sh "whoami"

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
                dir("docker"){
                    // change directory
                    sh 'docker build --tag=wildfly-app .'
                    sh 'oc docker push wildfly-app'
                }
            }
        }

        stage('Update Kubernetes spec') {
            steps {
                // send a message to the deployment repo update job
                echo 'Move along. Nothing to see here.'
            }
        }
    }

    post{
        always{
            echo "Bye"
        }
        failure{
//            mail(to: "team@example.com", subject: 'The Pipeline failed :-< ' )
            echo 'oh no... it went WRONG'
            sleep 60
            sleep 60
            sleep 60
            sleep 60
            sleep 60
            sleep 60
            sleep 60
            sleep 60
            sleep 60
            sleep 60
        }
    }


}