<h1> AWS Full Stack DevOps Project </h1>
<h2> Login System - Node, MySQL, React </h2>

<p>A production-style full stack application deployed on AWS using Infrastructure as Code, containerization, and automated CI/CD pipelines.</p>

<p>This project demonstrates how modern cloud-native applications are deployed using <b> Terraform, Docker, ECS Fargate, and CloudFront. </b> </p>

<img width="1536" height="1024" alt="ChatGPT Image Mar 13, 2026, 01_12_07 PM" src="https://github.com/user-attachments/assets/bf9b93a5-de33-4a6d-b492-8c4d048883fc" />



<b>Note :-</b> <p>To run this project on your local machine - refer this repo :- https://github.com/mushfiqurniazzz/Login-System---Node--MySQL--React

## Tech Stack

### Frontend

- **React (Vite)**
- Hosted on **AWS S3**
- Delivered globally via **CloudFront CDN**

### Backend

- **Node.js**
- **Express.js**
- **Docker container**

### Infrastructure

- **Terraform** (Infrastructure as Code)
- **AWS VPC**
- **Public & Private Subnets**
- **Internet Gateway**
- **NAT Gateway**

### Compute

- **Amazon ECS Fargate**

### Database

- **Amazon RDS MySQL**

### Container Registry

- **Amazon ECR**

### CI/CD

- **GitHub Actions**


# AWS Full-Stack Infrastructure

## Infrastructure Overview

The entire AWS infrastructure is provisioned using **Terraform**, enabling full **Infrastructure as Code (IaC)** and reproducible deployments.

### Resources Provisioned

- **VPC**
- **Public Subnets**
- **Private Subnets**
- **Internet Gateway**
- **NAT Gateway**
- **Application Load Balancer (ALB)**
- **ECS Cluster & Service (Fargate)**
- **Amazon ECR Repository**
- **RDS MySQL Database**
- **S3 Static Website Hosting**
- **CloudFront Distribution**
- **CI/CD Pipeline**

---

# CI/CD Pipeline

## Backend Deployment
GitHub Push

↓

GitHub Actions

↓

Build Docker Image

↓

Push Image to Amazon ECR

↓

Update ECS Service


## Frontend Deployment

GitHub Push

↓

GitHub Actions

↓

Build React App

↓

Upload dist/ to S3

↓

Invalidate CloudFront Cache


---

# Features

- **Full Infrastructure as Code** using Terraform
- **Dockerized Backend Service**
- **Serverless Containers** powered by ECS Fargate
- **Global CDN** using CloudFront
- **Secure Private Networking** for the database (RDS)
- **Automated CI/CD Pipelines** via GitHub Actions
- **Production-style AWS Architecture**



<h3> How to Deploy </h3>

Follow the steps below to deploy the complete infrastructure and application.

---

## 1. Install Terraform

First, install **Terraform** on your local machine.

### Linux / macOS

``` bash
curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -
sudo apt-get update
sudo apt-get install terraform

```

Verify installation:
``` bash
terraform -v
```


## 2. Create IAM User for Terraform


  ### Step 1. Go to AWS Console
  Login to your AWS Management Console.
  
  ### Step 2. Navigate to IAM
  - Open **IAM (Identity and Access Management)**
  - Click on **Users** from the left sidebar.
  
  ### Step 3. Create a New User
  - Click **Create User**
  - Enter a **User name** (for example: `terraform-user`)
  
  ### Step 4. Enable Programmatic Access
  - Under **Access Type**, enable **Programmatic access**
  - This will generate **Access Key ID** and **Secret Access Key** required for Terraform and CI/CD pipelines.
  
  ### Step 5. Attach Required Policies
  Attach the following policies to allow infrastructure provisioning and deployments:
  
  - `AmazonEC2ContainerRegistryFullAccess`
  - `AmazonEC2ContainerRegistryPowerUser`
  - `AmazonEC2FullAccess`
  - `AmazonECS_FullAccess`
  - `AmazonRDSFullAccess`
  - `AmazonS3FullAccess`
  - `CloudFrontFullAccess`
  - `IAMFullAccess`
  
  ### Step 6. Create User and Save Credentials
  After creating the user:
  
  - Download or copy the **Access Key ID**
  - Download or copy the **Secret Access Key**
  
  These credentials will be used in **terraform**.

## 3. Clone the Repository
Clone this repository to your local machine:
   ~~~ 
   git clone https://github.com/ayan8125/aws-full-stack-project
   ~~~

## 4.  GitHub Actions Configurationy
  ## IAM User Setup for GitHub Actions (CI/CD)

Follow these steps to create an IAM user that will be used by **GitHub Actions** to deploy infrastructure and application resources to AWS.

### step 1. Go to AWS Console
Login to the **AWS Management Console**.

### step 2. Navigate to IAM
- Open **IAM (Identity and Access Management)**
- Click **Users** from the left sidebar.

### step 3. Create a New User
- Click **Create User**
- Enter a **User name** (for example: `github-actions-user`)

### step 4. Enable Programmatic Access
- Under **Access Type**, enable **Programmatic access**  
- This allows GitHub Actions to authenticate using **Access Keys**.

### step 5. Attach Required Policies
Attach the following policies to allow GitHub Actions to deploy and manage AWS resources:

- `AmazonEC2ContainerRegistryFullAccess`
- `AmazonEC2ContainerRegistryPowerUser`
- `AmazonECS_FullAccess`
- `AmazonECRFullAccess`


### step 6. Create User and Save Credentials
After creating the user:

  - Download or copy the **Access Key ID**
  - Download or copy the **Secret Access Key**

  These credentials will be used in **Github**.
  
## 5.  Add Credentials to GitHub Secrets
To successfully run the **CI/CD pipelines**, certain **environment variables and secrets** must be configured in GitHub.

Go to your **GitHub Repository → Settings → Secrets and variables → Actions → Repository secrets → New Repository secrets **

Add the following **Secrets**:

### Required GitHub Secrets
- **AWS_ACCESS_KEY_ID** - AWS IAM access key used by GitHub Actions
- **AWS_SECRET_ACCESS_KEY** - Secret key for the IAM user
- **AWS_REGION** - AWS region where infrastructure is deployed



### Why These Variables Are Required

These variables allow GitHub Actions to:

- Authenticate with AWS
- Build and push Docker images to **Amazon ECR**
- Update the **ECS service** with the latest container image
- Upload the frontend build to **S3**
- Invalidate **CloudFront cache** to serve the latest frontend

This ensures a **fully automated deployment pipeline**.

## 5.  Initialize Terraform

 ```
 cd terraform
 terraform init
 ```

## 6.  Apply Infrastructure
  
  ```
    terraform plan
    terraform apply
  ```

## 7.  GitHub Actions Variables (Set After Terraform Deployment)

Once **Terraform finishes creating all AWS resources**, configure the following **GitHub repository variables** so the CI/CD pipeline can deploy the application correctly.

Go to:

** GitHub Repository → Settings → Secrets and variables → Actions → Secrets → New Repository secrets **

Add the following variables:

- **ECR_REPOSITORY**  
  Amazon ECR repository name where Docker images for the backend will be pushed.

- **ECS_CLUSTER_NAME**  
  Name of the ECS cluster where the backend containers are running.

- **ECS_SERVICE_NAME**  
  ECS service that GitHub Actions will update during deployment.

- **S3_BUCKET_NAME**  
  S3 bucket used to host the frontend React application.

- **VITE_API_URL**  
  CloudFront distribution domain name used by the frontend to communicate with the backend API.

> These values are obtained from the **Terraform outputs** once the infrastructure provisioning is complete.


## 8.  Trigger Deployment

To trigger the **CI/CD pipelines**, you need to push changes to the respective parts of the repository.

### Backend Deployment

Any change pushed to the **backend application** will trigger the backend pipeline.

Example:

```bash
git add backend/
git commit -m "Update backend service"
git push origin main

```

### Frontend Deployment

To trigger the frontend pipeline, push a change inside the frontend directory.
Even a small tweak (for example updating text or styling) will trigger deployment.

```bash
git add frontend/
git commit -m "Minor frontend update"
git push origin main
```

Once the workflow completes, the latest version of the application will be available through CloudFront.

<img width="1897" height="986" alt="image" src="https://github.com/user-attachments/assets/02d3c7fb-9d77-4313-811c-285d10daf06d" />


