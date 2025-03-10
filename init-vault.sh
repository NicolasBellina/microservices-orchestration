#!/bin/bash

# Attendre que Vault soit démarré
echo "Attente du démarrage de Vault..."
sleep 10

# Configuration des variables d'environnement Vault
export VAULT_ADDR='http://127.0.0.1:8200'
export VAULT_TOKEN='root'

# Activer le moteur de secrets KV version 2
echo "Configuration du moteur de secrets KV..."
vault secrets enable -version=2 kv

# Création des secrets pour l'environnement de développement
echo "Configuration des secrets pour l'environnement dev..."
vault kv put kv/dev/database \
    DB_HOST=db \
    DB_USER=dev_user \
    DB_PASSWORD=dev_password \
    DB_NAME=dev_db \
    DB_ROOT_PASSWORD=dev_root_password \
    JWT_SECRET=dev_jwt_secret

# Création des secrets pour l'environnement de production
echo "Configuration des secrets pour l'environnement prod..."
vault kv put kv/prod/database \
    DB_HOST=db \
    DB_USER=prod_user \
    DB_PASSWORD=prod_secure_password \
    DB_NAME=prod_db \
    DB_ROOT_PASSWORD=prod_root_secure_password \
    JWT_SECRET=prod_jwt_secret

echo "Configuration de Vault terminée !"

# Afficher les secrets pour vérification
echo "Vérification des secrets..."
echo "Secrets dev :"
vault kv get kv/dev/database
echo "Secrets prod :"
vault kv get kv/prod/database
