pipeline {
    agent any

    stages {

        stage('Build') {
            steps {
                
                script{
                    git branch : 'main' , url : 'https://github.com/MEDAYDI/devsecopsProject.git'
                    sh 'docker-compose create'
                }
                
            }

            
        }
    }
}
