# DevOps Assessment — Containerize & Deploy Next.js on Minikube

## What this repo contains
- Next.js app (minimal)
- Dockerfile — production, multi-stage build
- GitHub Actions workflow to build & push to GHCR
- Kubernetes manifests (`k8s/deployment.yaml` and `service.yaml`)
- .dockerignore

## Prerequisites
- Node.js 18.x
- Docker
- Minikube
- kubectl
- Git

## Local development
```bash
npm install
npm run dev
# Open http://localhost:3000
```

## Build & run Docker locally
```bash
docker build -t nextjs-local:latest .
docker run --rm -p 3000:3000 nextjs-local:latest
# Open http://localhost:3000
```

## GitHub Actions
Workflow triggers on push to main branch, builds multi-platform Docker image, tags it (latest, commit SHA, branch), and pushes to GHCR.

## Deploy to Minikube
```bash
minikube start --driver=docker
kubectl apply -f k8s/
minikube service nextjs-service --url
```

## GHCR image URLs
ghcr.io/MojeshReddy/nextjs-devops-assessment:latest
ghcr.io/MojeshReddy/nextjs-devops-assessment:first

## Submission Email
**Subject:** DevOps Assessment Submission - [Your Name]  
**Body:**
Repository: https://github.com/MojeshReddy/nextjs-devops-assessment  
GHCR image(s): ghcr.io/MojeshReddy/nextjs-devops-assessment:latest
# nextjs-devops-assessment
