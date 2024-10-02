# CI/CD Demo Project
This project demonstrates a basic CI/CD pipeline using AWS, Jenkins, Docker, and GitHub.

## Project Overview:

### AWS Setup:
* Created an EC2 instance with a t2micro instance type running Ubuntu.
* Created a specific user with minimum permissions for the project.

### GitHub Integration:
* Linked the project's GitHub repository with Jenkins.
* Configured Jenkins to automatically trigger builds upon changes to the repository.

### Development Environment:
* Used Visual Studio Code as the development environment.

### Jenkins Configuration:
* Installed Jenkins and configured it to access the GitHub repository.
* Created a Jenkins job to execute the CI/CD pipeline.

### Project Structure:
* Dockerfile: Defines the Docker image build process.
* package.json: Manages project dependencies.
* index.js: Contains the application's logic.
* Jenkinsfile: Defines the CI/CD pipeline steps.

### Pipeline Steps:
1. Checkout: Clones the project's GitHub repository.
2. Build: Builds a Docker image based on the Dockerfile.
3. Deploy: Deploys the containerized application on Docker.