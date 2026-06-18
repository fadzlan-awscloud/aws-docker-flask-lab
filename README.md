# Docker Flask Lab
A simple Flask web application containerized using Docker.

# Docker Flask Lab on AWS EC2-Point of Details

## Project Overview

This project demonstrates how to deploy a containerized Flask web application on an AWS EC2 instance using Docker. Infrastructure was provisioned using Terraform, Docker was installed on the EC2 instance, and the application image was published to Docker Hub.

---

## Project Objective

The objective of this project is to:

* Provision cloud infrastructure using Terraform
* Launch and manage an AWS EC2 instance
* Install and configure Docker on Linux
* Build a Flask application container image
* Run the application inside a Docker container
* Publish the image to Docker Hub
* Access and test the application through a web browser and command line

---

## Technologies & Tools

| Category               | Technology         |
| ---------------------- | ------------------ |
| Cloud Platform         | AWS EC2            |
| Infrastructure as Code | Terraform          |
| Containerization       | Docker             |
| Application Framework  | Flask              |
| Container Registry     | Docker Hub         |
| Operating System       | Ubuntu Linux       |
| Version Control        | Git                |
| Repository Hosting     | GitHub             |
| CLI Tools              | AWS CLI, SSH, Curl |

---

## Architecture Diagram

```text
Developer Machine
        │
        ▼
Terraform
        │
        ▼
AWS EC2 Instance
        │
        ▼
Docker Engine
        │
        ▼
Flask Container
        │
        ▼
Port 5000
        │
        ▼
Web Browser / Curl
```

---

## Project Workflow

### 1. Infrastructure Provisioning

* Created an EC2 instance using Terraform
* Configured security groups
* Allowed inbound traffic on:

  * Port 22 (SSH)
  * Port 5000 (Flask Application)

### 2. EC2 Access

* Connected securely using SSH key authentication
* Verified Linux environment readiness

### 3. Docker Installation

* Installed Docker Engine on Ubuntu EC2
* Started and enabled Docker service
* Verified installation

### 4. Flask Application Development

* Created a simple Flask application
* Defined dependencies in `requirements.txt`
* Created a Dockerfile

### 5. Docker Image Build

* Built a custom Docker image
* Verified image creation locally

### 6. Container Deployment

* Ran the Flask container
* Exposed port 5000
* Verified container status

### 7. Application Testing

* Tested application using:

```bash
curl http://localhost:5000
```

Output:

```text
Hello from Docker Flask Lab!
```

### 8. Docker Hub Integration

* Logged into Docker Hub
* Tagged Docker image
* Pushed image to Docker Hub repository

---

## Screenshots

### Terraform Deployment

![Terraform Apply](docker-flask-lab/image Terraform apply.png)

---

### Docker Installation Verification

![Docker Installed](docker-flask-lab/image Docker installed.png)

---

### Docker Container Running

![Container Running](docker-flask-lab/image Docker PS-container.png)

---

### Application Test

![Curl Test](docker-flask-lab/image Docker curl-http.png)

---

### Docker Hub Push

![Docker Hub Push](docker-flask-lab/image docker Hub Push.png)

---

## Docker Hub Repository

Docker image published to Docker Hub:

```bash
docker pull fadzlanomar45/flask-lab:v1.0
```

Repository:

https://hub.docker.com/r/fadzlanomar45/flask-lab

---

## Key Commands Used

### Build Image

```bash
docker build -t flask-lab .
```

### Run Container

```bash
docker run -d -p 5000:5000 --name web-flask-server flask-lab
```

### Check Running Containers

```bash
docker ps
```

### Test Application

```bash
curl http://localhost:5000
```

### Push to Docker Hub

```bash
docker push fadzlanomar45/flask-lab:v1.0
```

---

## Skills Demonstrated

* AWS EC2 Management
* Infrastructure as Code (Terraform)
* Linux Administration
* Docker Containerization
* Container Deployment
* Docker Hub Registry Management
* SSH Connectivity
* Application Deployment
* Git & GitHub Version Control
* Basic Networking and Port Mapping

---

## What I Learned

Through this project, I gained hands-on experience in:

* Provisioning cloud resources using Terraform
* Connecting securely to Linux servers via SSH
* Installing and managing Docker on AWS EC2
* Building Docker images from application source code
* Running and managing containers
* Publishing container images to Docker Hub
* Testing applications using command-line tools
* Managing project source code with Git and GitHub
* Understanding the complete workflow from infrastructure provisioning to application deployment

---

## Future Improvements

* Deploy using Docker Compose
* Use Nginx as a reverse proxy
* Store images in Amazon ECR
* Automate deployment with GitHub Actions
* Deploy to ECS or Kubernetes
* Add monitoring and logging with CloudWatch

```
```
