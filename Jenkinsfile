pipeline {
    agent any
    
    environment {
        // Define any environment variables, such as SSH credentials ID
        SSH_CREDENTIALS_ID = 'Mart'
        EC2_USER = 'ec2-user' // or any other username you use to access the instance
        EC2_HOST = '13.233.156.25' // IP of your EC2 instance
        REMOTE_DIR = '/home/ec2-user/client' // Remote directory on the EC2 instance
    }
    
    stages {
        stage('Checkout') {
            steps {
                // Clone the Vue.js frontend project from your Git repository
                git branch: 'main', url: 'https://github.com/Venu1433697/React-E-Mart.git'
            }
        }
        
        stage('Install Dependencies') {
            steps {
                bat 'npm install'
                    }
                }
        
        stage('Build') {
            steps {
                // Build the Vue.js project
                bat 'npm run build'
            }
        }
        
        stage('Deploy to EC2') {
            steps {
                // Deploy the build artifacts to the EC2 instance
                sshagent([SSH_CREDENTIALS_ID]) {
                    bat """
                    ssh -o StrictHostKeyChecking=no $EC2_USER@$EC2_HOST 'rm -rf $REMOTE_DIR/*'
                    scp -r dist/* $EC2_USER@$EC2_HOST:$REMOTE_DIR/
                    """
                }
            }
        }
    }
    
    post {
        success {
            echo 'Deployment succeeded!'
        }
        failure {
            echo 'Deployment failed.'
        }
    }
}
