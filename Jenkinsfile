pipeline {
    agent any

    stages {

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t devops-build-app:${BUILD_NUMBER} .'
            }
        }

        stage('Docker Login') {
            steps {
                withCredentials([
                    usernamePassword(
                        credentialsId: 'dockerhub-cred',
                        usernameVariable: 'DOCKER_USER',
                        passwordVariable: 'DOCKER_PASS'
                    )
                ]) {

                    sh '''
                    echo $DOCKER_PASS | docker login -u $DOCKER_USER --password-stdin
                    '''
                }
            }
        }

        stage('Push Image') {

            steps {

                script {

                    if(env.BRANCH_NAME == "dev") {

                        sh '''
                        docker tag devops-build-app:${BUILD_NUMBER} kalyangogu/dev:${BUILD_NUMBER}
                        docker push kalyangogu/dev:${BUILD_NUMBER}
                        '''

                        echo 'Image Pushed to Dev repo in docker hub'

                    } else if(env.BRANCH_NAME == "master") {

                        sh '''
                        docker tag devops-build-app:${BUILD_NUMBER} kalyangogu/prod:${BUILD_NUMBER}
                        docker push kalyangogu/prod:${BUILD_NUMBER}
                        '''

                        echo 'Image Pushed to Prod repo in docker hub'
                    }
                }
            }
        }
    }
}
