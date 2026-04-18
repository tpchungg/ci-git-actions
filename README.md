☁️ Cloud-Native GitOps CI/CD Pipeline
A fully automated, zero-touch Cloud-Native deployment pipeline leveraging AWS EKS, GitHub Actions, and ArgoCD. This project demonstrates modern Infrastructure as Code (IaC), immutable infrastructure principles, and GitOps-driven continuous delivery.

🚀 Project Overview
Instead of traditional push-based deployments, this project uses a Pull-based GitOps architecture to securely deploy a Python microservice onto an Amazon EKS cluster.

Infrastructure: Provisioned entirely via Terraform (VPC, EKS, Security Groups).

CI Pipeline: GitHub Actions automates linting, testing, Docker image building, and pushing to Amazon ECR.

CD Pipeline: ArgoCD acts as an in-cluster operator, constantly monitoring Git state and automatically reconciling any configuration drift.

Observability: Prometheus actively scrapes the /healthcheck endpoints, while Grafana visualizes the real-time telemetry data.

🛠️ Technology Stack
App: Python, Flask

Containerization: Docker

CI/CD: GitHub Actions, ArgoCD (GitOps)

Cloud & Orchestration: AWS EKS, Amazon ECR

Infrastructure as Code (IaC): Terraform

Observability: Prometheus, Grafana

🏗️ Architecture Flow
Developer pushes code to the main branch.

GitHub Actions triggers the CI workflow -> builds the Docker image -> pushes to Amazon ECR.

GitHub Actions updates the image tag in the k8s-manifests/deployment.yaml file.

ArgoCD detects the change in the repository and automatically pulls the new manifest to sync the EKS cluster.

Prometheus continuously scrapes metrics from the newly spun-up pods, displaying health data on Grafana.

⚙️ How to run this project
Navigate to the /terraform directory and run terraform init & terraform apply to provision the AWS infrastructure.

Install ArgoCD on the EKS cluster and apply the k8s-manifests/argocd-config.yaml.

Push a code change to the app/ directory and watch the magic happen in the GitHub Actions tab and ArgoCD UI!