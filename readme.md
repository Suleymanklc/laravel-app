# Laravel Application

Welcome to the Laravel Application repository! This projecat serves as a demonstration of deploying a Laravel application on AWS ECS using Terraform. It includes an Nginx web server, a MySQL database container, and an Application Load Balancer (ALB) for public access.

## Overview

This project showcases the deployment of a Laravel application on AWS ECS with the following components:

- **Nginx**: Serves the Laravel application.
- **MySQL**: Runs as a container in ECS.
- **Application Load Balancer (ALB)**: Provides a public endpoint to access the Laravel application.

## Getting Started

Follow the steps below to set up and deploy the Laravel application:

### Prerequisites

Ensure you have the following prerequisites installed on your local machine:

- [AWS CLI](https://aws.amazon.com/cli/)
- [Terraform](https://www.terraform.io/downloads.html)
- [Docker](https://www.docker.com/products/docker-desktop)

  ```
  aws eks update-kubeconfig --region eu-central-1  --name laravel-eks
  ```

### Clone the Repository

Clone this repository to your local machine using the following command:

```bash
git clone https://github.com/Suleymanklc/laravel-app.git
cd laravel-app
```
