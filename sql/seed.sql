-- Insertion de données de test pour l'environnement de développement
USE ${DB_NAME};

-- Données de test pour la table users
INSERT INTO users (username, password) VALUES
('testuser1', 'hashedpassword1'),
('testuser2', 'hashedpassword2');

-- Autres données de test nécessaires 