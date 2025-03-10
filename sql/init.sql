-- Création de la base de données si elle n'existe pas
CREATE DATABASE IF NOT EXISTS ${DB_NAME};
USE ${DB_NAME};

-- Table des utilisateurs (pour auth-app)
CREATE TABLE IF NOT EXISTS users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(255) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Autres tables nécessaires pour api-app
-- (À compléter avec les tables dont votre collègue a besoin) 