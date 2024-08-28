Voici un exemple de contenu pour un fichier `README.md` en fran�ais qui pourrait aider les autres � lancer votre application sur leurs machines :

```markdown
# Notes Manager

## Description

Notes Manager est une application web qui permet aux utilisateurs de cr�er, mettre � jour et supprimer des notes avec un niveau d'importance sp�cifi�. L'application est construite avec Node.js, Express, et MySQL, et est conteneuris�e avec Docker.

## Pr�requis

Avant de lancer ce projet, assurez-vous d'avoir les �l�ments suivants install�s :

- Node.js (version 18.x ou sup�rieure)
- npm (Node Package Manager)
- Docker et Docker Compose
- Serveur MySQL (MariaDB)

## Installation

1. **Cloner le d�p�t** :

   ```bash
   git clone https://github.com/fabstock/notes-manager
   cd notes-manager
   ```

2. **Cr�er un fichier `.env`** � la racine du projet et le remplir avec les variables d'environnement suivantes :

   ```bash
   PORT=3000
   WEB_PORT=3001
   DB_HOST=localhost
   DB_USER=notes_user1
   DB_PASSWORD=notes_user1
   DB_NAME=notes_manager
   API_BASE_URL=http://localhost:3000
   ```

3. **Installer les d�pendances** pour les parties API et Web de l'application :

   ```bash
   npm run install:all
   ```
4. installer la Bdd 
```bash
   sudo apt-get update
   sudo apt-get install mariadb-server
```
5. importation du sch�ma de la Bdd
```bash
   sudo mariadb -u root -p
```
```sql
   CREATE user 'notes_user1'

   SOURCE db/init.sql 

   GRANT ALL PRIVILEGES ON notes_manager.* TO 'notes_user1'@'localhost';

   FLUSH PRIVILEGES;
```
## Lancer l'application en local

### Avec Node.js

1. **D�marrer le serveur API** :

   ```bash
   npm run start:api
   ```

   Cela d�marrera le serveur API sur `http://localhost:3000`.

2. **D�marrer le serveur Web** :

   Ouvrez une nouvelle fen�tre de terminal et ex�cutez :

   ```bash
   npm run start:web
   ```

   Cela d�marrera le serveur web sur `http://localhost:3001`.

3. **Acc�der � l'application** :

   Ouvrez votre navigateur et rendez-vous sur `http://localhost:3001` pour utiliser l'application Notes Manager.

## Tests

Pour ex�cuter les tests unitaires de l'application, utilisez :

```bash
npm test
```

## D�pannage

- **Probl�mes de connexion � la base de donn�es** : Assurez-vous que votre serveur MySQL est en cours d'ex�cution et que les identifiants dans votre fichier `.env` sont corrects.
- **Conflits de ports** : Assurez-vous que les ports 3000 et 3001 ne sont pas utilis�s par d'autres applications sur votre machine.

## Licence

Ce projet est sous licence MIT - voir le fichier [LICENSE](LICENSE) pour plus de d�tails.


### Explication:

- **Pr�requis** : Liste les logiciels n�cessaires.
- **Installation** : Instructions pour configurer le projet.
- **Lancer l'application en local** : Fournit des �tapes pour ex�cuter l'application avec Node.js.
- **Tests** : D�crit comment ex�cuter la suite de tests.
- **D�pannage** : Offre des conseils de base pour les probl�mes courants.
- **Licence** : Mentionne la licence (que vous pouvez adapter selon vos pr�f�rences).

Ce fichier `README.md` devrait fournir un guide complet pour permettre � d'autres utilisateurs de configurer et d'ex�cuter votre application facilement.
