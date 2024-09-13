# Project Report: EKS Cluster with ALB Ingress Controller and CI/CD Pipeline

## Overview

This project focuses on provisioning an **Amazon EKS** cluster using **Terraform**, deploying a **Java Spring Boot application** with **Helm**, and automating the entire process using a **CI/CD pipeline** via **GitHub Actions**. The architecture leverages **AWS services** like EKS, Application Load Balancer (ALB), and IAM roles with OpenID Connect (OIDC) for secure access control.

## Approach

1. **Infrastructure Provisioning**:
   - The **Amazon EKS cluster** was provisioned using **Terraform**. This included setting up the necessary VPC, security groups, and subnets to ensure the cluster had the required networking components.
   - **ALB Ingress Controller** was deployed to manage routing for external traffic to the Kubernetes cluster. The ingress controller facilitates load balancing using AWS ALB.
   
2. **Containerization and Deployment**:
   - The Java Spring Boot application was containerized using **Docker**. A **Dockerfile** was created to build the image, which was then pushed to **Docker Hub**.
   - **Helm** was used to deploy the application on the EKS cluster. This allowed easy management and scaling of Kubernetes resources.

3. **CI/CD Pipeline**:
   - **GitHub Actions** was used to automate the infrastructure provisioning and application deployment. The pipeline included stages to build and push the Docker image, provision the EKS infrastructure, and deploy the application via Helm.

## Choices Made

1. **Terraform for Infrastructure as Code**:
   - Terraform was chosen for provisioning infrastructure due to its popularity, ease of use, and the ability to define AWS resources declaratively. The decision to use modules helped in reusability and easier updates in the future.

2. **Helm for Kubernetes Deployment**:
   - Helm was selected for managing Kubernetes resources because it simplifies the deployment process, making it easy to manage multiple Kubernetes resources as a single entity (Helm chart). Helm also facilitates rolling updates and rollback capabilities.

3. **GitHub Actions for CI/CD**:
   - GitHub Actions was used as the CI/CD tool to automate the build, test, and deploy stages. It integrates well with GitHub repositories, enabling easy automation of workflows triggered by code changes.

4. **OIDC for Secure Access**:
   - OIDC was used for **IAM role assumption** to securely allow the **ALB Ingress Controller** to access the AWS resources without hardcoding credentials, improving security and scalability.

## Challenges Faced

1. **OIDC Configuration**:
   - Setting up **OIDC** for the ALB Ingress Controller posed challenges, particularly with understanding the structure of the identity and how to correctly refer to it within Terraform. This was mitigated by using data lookups and ensuring proper IAM role configuration.

2. **Helm Chart Customization**:
   - The Helm chart for the Java Spring Boot application required customization to ensure it met the specific needs of the EKS environment, such as Ingress configuration for the ALB. Ensuring proper configuration for seamless integration took some trial and error.

3. **CI/CD Pipeline Debugging**:
   - Integrating the pipeline was another challenge, especially ensuring that each step (Docker build, infrastructure provisioning, Helm deployment) worked seamlessly together. Misconfigurations in the pipeline required debugging and adjusting the workflow syntax.

## Conclusion

The project successfully automated the provisioning of an EKS cluster and the deployment of a Java Spring Boot application using Docker, Helm, and GitHub Actions. Challenges were addressed through careful planning and iterative problem-solving, resulting in a modular, maintainable, and scalable architecture.
