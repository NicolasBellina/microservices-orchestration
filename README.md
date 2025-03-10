https://github.com/TomMbn/api-app
https://github.com/sziane-pro/auth-app


# Microservices Orchestration

Ce dépôt contient la configuration Docker Compose pour orchestrer nos microservices.

## Services
- auth-app : Service d'authentification (JWT)
- api-app : Service métier
- db : Base de données MySQL

## Configuration

1. Copier le fichier `.env.example` pour créer vos fichiers d'environnement :
```bash
cp .env.example env/dev.env
cp .env.example env/prod.env
```

2. Modifier les variables dans chaque fichier d'environnement selon vos besoins.

## Utilisation

### Environnement de développement :
```bash
ENV=dev docker-compose up --build
```

### Environnement de production :
```bash
ENV=prod docker-compose up --build
```
```

6. **Coordination avec l'équipe** :
- Assurez-vous que les ports et les variables d'environnement correspondent à ceux utilisés dans les services `auth-app` et `api-app`
- Communiquez avec vos collègues pour synchroniser les configurations
- Testez l'orchestration une fois que les autres services sont prêts

7. **Pour le bonus Vault** (si implémenté) :
Ajouter le service Vault dans le `docker-compose.yml` :

```yaml:docker-compose.yml
  vault:
    image: vault:latest
    ports:
      - "8200:8200"
    environment:
      VAULT_DEV_ROOT_TOKEN_ID: root
      VAULT_DEV_LISTEN_ADDRESS: 0.0.0.0:8200
    cap_add:
      - IPC_LOCK
    networks:
      - app-network
```

Votre rôle est crucial car vous devez vous assurer que tous les services peuvent communiquer entre eux correctement et que les variables d'environnement sont correctement gérées pour chaque environnement.# microservices-orchestration
