# Project Overview: Automated DevOps Pipeline for a Spring Boot Application

## Introduction

This project aims to establish a fully automated DevOps pipeline for deploying a Spring Boot application. Leveraging a suite of powerful tools including Jenkins, OpenShift, Terraform, Ansible, and Docker, the project embodies the principles of Infrastructure as Code (IaC), Continuous Integration (CI), and Continuous Deployment (CD). The end goal is to achieve streamlined, automated, and efficient deployment processes with robust monitoring and alerting capabilities.

![arch_diagram](https://github.com/salmaHany01/MultiCloudDevOpsProject/screenshots/arch_diagram.png)
<br><em>Project Architecture</em>


## Requirements
- :white_circle: GitHub
- :white_circle: AWS 
- :white_circle: Terraform
- :white_circle: Ansible
- :white_circle: Docker
- :white_circle: SonarQube
- :white_circle: Openshift cluster


## Project Components

### 1. Spring Boot Application Deployment Using Jenkins on OpenShift

The objective of automating the deployment of a Spring Boot application within an OpenShift cluster is achieved through Jenkins. By developing Jenkins pipelines that efficiently manage the deployment lifecycle from code commit to production deployment, we ensure a scalable and resilient process. 


### 2. AWS Infrastructure Provisioning Using Terraform

Provision and manage a complete AWS infrastructure using Terraform, enabling IaC practices. This approach not only streamlines the creation of AWS resources but also integrates them with CloudWatch for monitoring and alerting.


**Deploying the terraform modules to provision resources:**
* Install AWS CLI and add your AWS user access key and secret access key to enable  

```shell
$ curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
$ unzip awscliv2.zip
$ sudo ./aws/install
$ aws configure
```
### 3. EC2 Instance Configuration Using Ansible
Utilizing Ansible for configuring AWS EC2 instances to host services such as Git, Docker, Java, Jenkins, SonarQube, and OpenShift. This approach ensures consistent and repeatable setups across instances, leading to fully configured and operational EC2 instances ready to support various stages of the DevOps pipeline.
1. Create a key pair on AWS. Download it to be used in the dynamic inventory and change its permissions as follows:
```shell
$ chmod 400 finalprojectKey.pem
```
2. Run the ansible playbook using the following command
```shell
$ ansible-playbook -i inventory/aws_ec2.yml playbook.yml
```


### 4. Centralized Monitoring and Logging with OpenShift
Implement a centralized monitoring and logging system within the OpenShift cluster. We gain insights into application performance and overall cluster health, thus enhancing operational visibility and intelligence.

### 5. Containerization of the Java Application

Containerizing the Java application is a key part of this project, ensuring environment consistency and ease of deployment. The development of a Dockerfile, detailing all dependencies and configurations, leads to a containerized version of the Java application. 

### 6. CI/CD Automation with Jenkins

Automate the CI/CD process using Jenkins, thereby streamlining the application deployment lifecycle. The development of a Jenkins pipeline script integrates various stages, including code build, testing, and deployment. This results in a seamless, automated pipeline that accelerates the release cycle and reduces manual intervention.


![jenkins-success](https://github.com/salmaHany01/MultiCloudDevOpsProject/screenshots/jenkins-success.png)
<br><em>Jenkins Pipeline Successful Build</em>

## Conclusion

This project successfully combines various advanced tools to create an efficient and automated system for deploying and managing a Spring Boot application. By using Jenkins for automation, OpenShift for orchestration, Terraform for setting up AWS infrastructure, Ansible for configuration, and Docker for containerization, we've streamlined the entire deployment process. This approach not only makes deploying applications quicker and more reliable but also ensures consistent performance and easy monitoring. The result is a straightforward, effective, and modern solution that meets the demands of today’s fast-paced software development and deployment needs.