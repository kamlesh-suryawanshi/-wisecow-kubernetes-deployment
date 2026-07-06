# wisecow-kubernetes-deployment
## Overview

This repository contains my submission for the AccuKnox DevOps Assessment.

The project demonstrates containerization, Kubernetes deployment, TLS configuration, CI/CD automation using GitHub Actions, and system monitoring scripts developed in Python.

---

## Prerequisites

Before getting started, ensure the following tools are installed:

- [Docker](https://docs.docker.com/get-docker/)
- [Minikube](https://minikube.sigs.k8s.io/docs/start/)
- [kubectl](https://kubernetes.io/docs/tasks/tools/)
- [Python 3.x](https://www.python.org/downloads/)
- Python dependencies: `pip install psutil requests`

---

# Problem Statement 1

## Features Implemented

- Dockerized Wisecow Application
- Kubernetes Deployment
- Kubernetes Service
- NGINX Ingress Configuration
- TLS Configuration
- GitHub Actions CI Pipeline
- GitHub Container Registry (GHCR) Integration
- Self-Hosted Runner Based CD Pipeline

---

## Dockerization

Build Docker Image:

```bash
docker build -t wisecow .
```

Run Docker Container:

```bash
docker run -p 4499:4499 wisecow
```

---

## Kubernetes Deployment

**Step 1: Create TLS Secret**

```bash
kubectl create secret tls wisecow-tls --cert=tls/tls.crt --key=tls/tls.key
```

**Step 2: Apply Kubernetes Resources**

```bash
kubectl apply -f k8s/
```

**Step 3: Verify Deployment**

```bash
kubectl get pods
kubectl get svc
kubectl get ingress
kubectl get secret
```

Expected secrets output:

```text
NAME          TYPE                DATA   AGE
wisecow-tls   kubernetes.io/tls   2      ...
```

---

## TLS Configuration

TLS was configured using a Kubernetes TLS Secret and NGINX Ingress.

Since the project was deployed on a local Minikube cluster, public certificate validation was not performed. A self-signed TLS certificate was used to demonstrate HTTPS configuration and secure communication within the Kubernetes environment.

The Ingress resource was configured to terminate TLS using the `wisecow-tls` secret.

---

## CI/CD Pipeline

The CI/CD pipeline is implemented using GitHub Actions.

### Continuous Integration (CI)

On every push to the `main` branch:

- Source code is checked out
- Docker image is built
- Docker image is pushed to GitHub Container Registry (GHCR)

### Continuous Deployment (CD)

After a successful image build:

- GitHub Actions triggers a Self-Hosted Runner
- Kubernetes deployment is automatically updated
- Deployment rollout is restarted

> **Note:** A GitHub Self-Hosted Runner was used because the Kubernetes cluster runs locally on Minikube. GitHub-hosted runners cannot directly access a local Minikube cluster, so deployment commands are executed through the self-hosted runner running on the same machine as the cluster.

Workflow File:

```text
.github/workflows/docker-build.yml
```

---

# Problem Statement 2

## 1. System Health Monitoring Script

**File:**

```text
ps2/system-health-monitor.py
```

**Features:**

- CPU Usage Monitoring
- Memory Usage Monitoring
- Disk Usage Monitoring
- Running Process Monitoring
- Alert Generation (threshold-based)
- Console and Log File Reporting

**Run:**

```bash
python3 ps2/system-health-monitor.py
```

---

## 2. Application Health Checker

**File:**

```text
ps2/app-health-checker.py
```

**Features:**

- HTTP Status Code Validation
- Application Availability Check
- UP/DOWN Status Detection
- Error Handling and Timeout Support

**Run:**

```bash
python3 ps2/app-health-checker.py
```

---

# Repository Structure

```text
accuknox-devops-assessment/
│
├── .github/
│   └── workflows/
│       └── docker-build.yml
│
├── k8s/
│   ├── deployment.yaml
│   ├── service.yaml
│   └── ingress.yaml
│
├── tls/
│   ├── tls.crt
│   └── tls.key
│
├── ps2/
│   ├── system-health-monitor.py
│   └── app-health-checker.py
│
├── images/
│   ├── deployment-tls.png
│   ├── cicd-success.png
│   └── monitoring-scripts.png
│
├── Dockerfile
├── wisecow.sh
├── README.md
└── LICENSE
```

---

# Screenshots

## Kubernetes Deployment and TLS

This screenshot demonstrates:

- Running Wisecow application
- Kubernetes Pods, Service, and Ingress
- TLS Secret configuration
- Repository structure

![Kubernetes Deployment and TLS](images/deployment-tls.png)

---

## CI/CD Pipeline Execution

This screenshot demonstrates:

- GitHub Actions Workflow execution
- Docker image build and push to GHCR
- Self-Hosted Runner triggering deployment
- Successful end-to-end CI/CD run

![CI/CD Pipeline](images/cicd-success.png)

---

## Monitoring Scripts Output

### System Health Monitoring Script

- CPU, Memory, and Disk usage monitoring
- Running process monitoring
- Threshold-based alert generation

### Application Health Checker

- HTTP status code verification
- UP/DOWN detection with error handling

![Monitoring Scripts](images/monitoring-scripts.png)

---

# Completed Objectives

All assignment objectives including challenge goals were successfully implemented:

| Objective | Status |
|---|---|
| Docker Containerization | ✅ Done |
| Kubernetes Deployment | ✅ Done |
| Ingress Configuration | ✅ Done |
| TLS Setup (Challenge Goal) | ✅ Done |
| GitHub Actions CI | ✅ Done |
| Continuous Deployment (Challenge Goal) | ✅ Done |
| GHCR Integration | ✅ Done |
| System Health Monitoring Script | ✅ Done |
| Application Health Checker Script | ✅ Done |

---

# Author

**Kamlesh Suryawanshi**

GitHub: [https://github.com/kamlesh-suryawanshi](https://github.com/kamlesh-suryawanshi)

Repository: [https://github.com/kamlesh-suryawanshi/accuknox-devops-assessment](https://github.com/kamlesh-suryawanshi/-wisecow-kubernetes-deployment)
