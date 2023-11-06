pipeline {
    agent any

    stages {

        stage('Build') {
            steps {
                
                script{
                    git branch : 'main' , url : 'https://github.com/MEDAYDI/devsecopsProject.git'
                    // sh 'docker-compose create'
                }
                
            }

      

        stage('Run Snyk Open Source Scan'){
            steps{
                snykSecurity(
                        snykInstallation: 'snyk@latest',
                        snykToken: "organisation-snyk-api-token",
                        failOnIssues: false,
                        monitorProjectOnBuild: true,
                        additionalArguments: '--all-projects --d'

                        // place other parameters here
                    )

            }
        }

         stage('Run Snyk Code Scan'){
            steps{
                snykSecurity(
                        snykInstallation: 'snyk@latest',
                        snykToken: "organisation-snyk-api-token",
                        failOnIssues: false,
                        monitorProjectOnBuild: false,
                        additionalArguments: '--code -debug'

                        // place other parameters here
                    )

            }
        }

         stage('Run Snyk Container Scan'){
            steps{
                snykSecurity(
                        snykInstallation: 'snyk@latest',
                        snykToken: "organisation-snyk-api-token",
                        failOnIssues: false,
                        monitorProjectOnBuild: true,
                        additionalArguments: '--container -debug'

                        // place other parameters here
                    )

            }
        }




    }
}
}
