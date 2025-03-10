# Guide de Tests d'Intégration

Ce document décrit les procédures de test pour vérifier le bon fonctionnement de notre architecture microservices.

## 1. Vérification de l'Infrastructure

### 1.1 Démarrage des Services
```bash
# Démarrer tous les services en mode développement
ENV=dev docker-compose up -d

# Vérifier que tous les conteneurs sont en cours d'exécution
docker-compose ps
```

### 1.2 Vérification des Logs
```bash
# Vérifier les logs de chaque service
docker-compose logs auth-app
docker-compose logs api-app
docker-compose logs db
docker-compose logs vault
```
  
## 2. Tests de la Base de Données

### 2.1 Connexion à MySQL
```bash
# Se connecter à la base de données
docker-compose exec db mysql -u root -p${DB_ROOT_PASSWORD}

# Vérifier les tables
SHOW DATABASES;
USE dev_db;
SHOW TABLES;
```

## 3. Tests de Vault (Bonus)

### 3.1 Vérification du Statut
```bash
# Vérifier l'état de Vault
curl -s http://localhost:8200/v1/sys/health | jq

# Vérifier l'accès aux secrets (dev)
curl -H "X-Vault-Token: root" \
     http://localhost:8200/v1/kv/data/dev/database

# Vérifier l'accès aux secrets (prod)
curl -H "X-Vault-Token: root" \
     http://localhost:8200/v1/kv/data/prod/database
```

## 4. Tests des Services

### 4.1 Service d'Authentification (auth-app)
```bash
# Test du statut du service
curl http://localhost:3000/health

# Test de création d'utilisateur (exemple)
curl -X POST http://localhost:3000/auth/register \
     -H "Content-Type: application/json" \
     -d '{"username": "testuser", "password": "testpass"}'

# Test de connexion
curl -X POST http://localhost:3000/auth/login \
     -H "Content-Type: application/json" \
     -d '{"username": "testuser", "password": "testpass"}'
```

### 4.2 Service API (api-app)
```bash
# Test du statut du service
curl http://localhost:3001/health

# Test avec un token JWT (remplacer ${TOKEN} par un token valide)
```

# Arrêter les services
docker-compose down

# Démarrer en mode production
ENV=prod docker-compose up --build
```

# Créer et utiliser les branches appropriées
git checkout -b develop
# Pour chaque nouvelle fonctionnalité
git checkout -b feature/nom-de-la-fonctionnalite
```

name: Docker Build

on:
  push:
    branches: [ main, develop ]
  pull_request:
    branches: [ main ]

jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v2
      
      - name: Build Docker Compose
        run: docker-compose build
      
      - name: Test Docker Compose
        run: |
          ENV=dev docker-compose up -d
          docker-compose ps
          docker-compose logs