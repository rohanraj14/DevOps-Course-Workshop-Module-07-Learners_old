pipeline {
    agent {
        docker {
            image 'mcr.microsoft.com/dotnet/sdk:6.0'
        }
    }

    stages {
         stage('Build') {
            steps {
                echo 'Building..'
                sh 'dotnet build'
                

                dir("DotnetTemplate.Web") {
                    sh 'npm install' 
                    sh 'npm run build'
                }
                
            }
        }
        stage('Test') {
            steps {
                echo 'Testing..'
                sh 'dotnet test'
                dir("DotnetTemplate.Web") {
                    sh 'npm t'
                }
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying....'
            }
        }
    }
}