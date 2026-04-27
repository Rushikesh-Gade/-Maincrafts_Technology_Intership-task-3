# Task 3 — CI/CD Automation for Dockerized Applications Using GitHub Actions

**Cloud Computing & DevOps Internship | Maincrafts Technology**

![Docker CI Pipeline](https://github.com/Rushikesh-Gade/-Maincrafts_Technology_Intership-task-3/actions/workflows/docker-ci.yml/badge.svg)

---

## What This Project Does

This project automates the Docker image build and push process using a **GitHub Actions CI/CD pipeline**.

Every time code is pushed to the `main` branch:
1. GitHub Actions triggers automatically
2. The Docker image is built from the `Dockerfile`
3. The image is pushed to Docker Hub — ready for deployment anywhere

---

## Project Structure

```
project-root/
├── index.html                        # Portfolio website
├── styles.css                        # Stylesheet
├── Dockerfile                        # Docker build instructions
├── .dockerignore                     # Files excluded from Docker image
└── .github/
    └── workflows/
        └── docker-ci.yml             # GitHub Actions CI pipeline
```

---

## CI/CD Pipeline Explained

### Manual Workflow (Task 2)
1. Write Dockerfile
2. Build Docker image manually
3. Run container manually
4. Deploy on EC2 manually

### Automated Workflow (Task 3)
1. Push code to GitHub
2. CI pipeline builds Docker image automatically
3. Image is pushed to Docker Hub automatically
4. Image is ready for deployment anytime

---

## GitHub Actions Workflow

File: `.github/workflows/docker-ci.yml`

```yaml
name: Docker CI Pipeline

on:
  push:
    branches:
      - main

jobs:
  docker-build:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout Code
        uses: actions/checkout@v3

      - name: Login to Docker Hub
        uses: docker/login-action@v2
        with:
          username: ${{ secrets.DOCKER_USERNAME }}
          password: ${{ secrets.DOCKER_PASSWORD }}

      - name: Build Docker Image
        run: docker build -t ${{ secrets.DOCKER_USERNAME }}/portfolio-website:latest .

      - name: Push Docker Image
        run: docker push ${{ secrets.DOCKER_USERNAME }}/portfolio-website:latest
```

---

## GitHub Secrets Setup

Go to your repository → **Settings → Secrets and variables → Actions → New repository secret**

| Secret Name       | Value                        |
|-------------------|------------------------------|
| `DOCKER_USERNAME` | `rushikeshgade2066`          |
| `DOCKER_PASSWORD` | Your Docker Hub password     |

---

## Docker Hub Image

```bash
docker pull rushikeshgade2066/portfolio-website:latest
docker run -d -p 8080:80 rushikeshgade2066/portfolio-website:latest
```

Then open: [http://localhost:8080](http://localhost:8080)

---

## Tools & Technologies

| Tool            | Purpose                          |
|-----------------|----------------------------------|
| GitHub Actions  | CI/CD automation                 |
| Docker          | Containerization                 |
| Docker Hub      | Container image registry         |
| Nginx (Alpine)  | Web server inside container      |
| YAML            | Workflow configuration           |

---

## Previous Tasks

- **Task 1** — [Static Portfolio on AWS S3 + CloudFront](https://github.com/Rushikesh-Gade/-Maincrafts_Technology_Intership-task1)
- **Task 2** — [Dockerized Web App on AWS EC2](https://github.com/Rushikesh-Gade/-Maincrafts_Technology_Intership-task-2)

---

*Internship Project — Maincrafts Technology | Rushikesh Gade*
