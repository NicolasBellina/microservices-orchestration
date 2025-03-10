# Installation

1. Cloner ce repo :
```bash
git clone [URL_DE_VOTRE_REPO] microservices-orchestration
cd microservices-orchestration
```

2. Cloner les services associés :
```bash
git clone [URL_DU_REPO_AUTH_APP] auth-app
git clone [URL_DU_REPO_API_APP] api-app
```

3. Configurer les environnements :
```bash
cp env/dev.env.example env/dev.env
cp env/prod.env.example env/prod.env
```

4. Démarrer les services :
```bash
ENV=dev docker-compose up --build
```
```

Cette organisation vous permettra de :
- Tester l'intégration complète localement
- Vérifier que les services communiquent correctement
- S'assurer que les variables d'environnement sont bien configurées
- Faciliter le développement et le débogage

N'oubliez pas de demander à vos collègues les URLs de leurs repos pour pouvoir les cloner !