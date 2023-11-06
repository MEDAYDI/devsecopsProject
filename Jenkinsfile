pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                script {
                    git branch: 'main', url: 'https://github.com/MEDAYDI/devsecopsProject.git'
                }
            }
        }

        stage('Run Snyk Open Source Scan') {
            steps {
                withCredentials([string(credentialsId: 'organisation-snyk-api-token', variable: 'SNYK_TOKEN')]) {
                    snykSecurity(
                        snykInstallation: 'snyk@latest',
                        snykToken: "${SNYK_TOKEN}",
                        failOnIssues: false,
                        monitorProjectOnBuild: true,
                        additionalArguments: '--all-projects --d'
                        // place other parameters here
                    )
                }
            }
        }

        stage('Run Snyk Code Scan') {
            steps {
                withCredentials([string(credentialsId: 'organisation-snyk-api-token', variable: 'SNYK_TOKEN')]) {
                    snykSecurity(
                        snykInstallation: 'snyk@latest',
                        snykToken: "${SNYK_TOKEN}",
                        failOnIssues: false,
                        monitorProjectOnBuild: false,
                        additionalArguments: '--code -debug'
                        // place other parameters here
                    )
                }
            }
        }

        stage('Run Snyk Container Scan') {
            steps {
                withCredentials([string(credentialsId: 'organisation-snyk-api-token', variable: 'SNYK_TOKEN')]) {
                    snykSecurity(
                        snykInstallation: 'snyk@latest',
                        snykToken: "${SNYK_TOKEN}",
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
