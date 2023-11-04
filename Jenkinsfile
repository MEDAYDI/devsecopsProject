pipeline {
    agent any

    stages {

        stage('Build') {
            steps {
                
                script{
                    git branch : 'main' , url : 'https://github.com/MEDAYDI/DevSecOpsProject.git'
                    sh 'docker-compose up'
                }
                
            }

            
        }
    }
}
