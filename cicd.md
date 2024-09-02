


 ##  this is a poor man pipeline  ,
 ###  a Not Optimize & not Secure pipeline for learning


 ### The most Famous Action Github 

 ### actions/checkout@v4
 - https://github.com/actions/checkout

 ### The good friend 
  - https://github.com/nektos/acthttps://github.com/nektos/act

 ### And the Ugly Bastards 

 - https://github.com/actions/cache
 - https://github.com/marketplace/actions/start-mariadb
 - 

 - https://docs.docker.com/build/ci/github-actions/configure-builder/
 - https://github.com/docker/build-push-action
 - https://github.com/docker/setup-buildx-action

 - https://github.com/EthanSK/git-branch-name-action
   https://github.com/marketplace/actions/git-branch-name

 - others:
   (à etudier - uses: getong/mariadb-action@v1.11 )
  -  https://docs.github.com/en/actions/using-github-hosted-runners/using-github-hosted-runners/about-github-hosted-runners#creating-and-using-secrets-encrypted-variables   
  - https://github.com/appleboy/ssh-action


 ### Jest npm test

 -  efface la db éxistante
 -  test écriture dans la db 2 

 ```

docker run --network docker_default -e DB_USER=notes_user1  -e DB_PASSWORD=notes_user1 -e DB_NAME=notes_manager   -e DB_HOST=mysql  -it  --rm  -v $(pwd)/api:/home/node/app/api   fabstock2/notes_manager:app_one-node  jest

 ```




```
 PASS  api/__tests__/notes.test.js
  Notes Manager
    ✓ should add a note (75 ms)
    ✓ should get a note by id (17 ms)
    ✓ should update a note (15 ms)
    ✓ should delete a note (19 ms)
    ✓ should get all notes (13 ms)

Test Suites: 1 passed, 1 total
Tests:       5 passed, 5 total
Snapshots:   0 total
Time:        0.817 s
Ran all test suites.



```






 ### webpack just one 

 - modifie le code de api/src/app.js  pour pouvoir acceder a api sans probleme cors 
   sur le nom de la  variable: env  WEB_BASE_URL 
   ex:  app_web

 - modifs du web/server.js en amont de branch pour incorporer dotenv et cors 
   et tests modifs sur api.js 

 - webpack modifie  web/public/index.html et remplace app.js par bundle.js 
   webpack --config webpack.config.js 

 - ajout de dossier  src et link symbolique de dist vers dossier web 
    ( docroot web/public/ )


 - localhost [/tmp/tm/notes-manager]$ git diff main..dev -- web/server.js
```
	diff --git a/web/server.js b/web/server.js
	index f2e54cb..07f7611 100644
	--- a/web/server.js
	+++ b/web/server.js
	@@ -1,6 +1,7 @@
	 const express = require('express');
	 const path = require('path');
	 const dotenv = require('dotenv');
	+const cors = require('cors');

	 dotenv.config();

	@@ -11,11 +12,34 @@ dotenv.config();
	 const app = express();
	 const port = process.env.WEB_PORT || 3001;

	+
	+const webUrl = process.env.WEB_BASE_URL || 'http://localhost:3001';
	+const appUrl = process.env.API_BASE_URL || 'http://localhost:3000';
	+
	+
	+
	+
	+var corsOptions = {
	+    //origin: 'http://app_web',
	+    //origin: '*',
	+  origin: webUrl,
	+  optionsSuccessStatus: 200 // some legacy browsers (IE11, various SmartTVs) choke on 204
	+}
	+/
	+// Activer CORS pour toutes les requêtes
	+app.use(cors(corsOptions));
	+//app.use(cors());
	+
	+
	+
	+
	+
	 // Servir les fichiers statiques du dossier 'public'
	 app.use(express.static(path.join(__dirname, 'public')));

	 app.listen(port, () => {
	-  console.log(`Web server running at http://localhost:${port}`);
	+  //console.log(`Web server running at http://localhost:${port}`);
	+  console.log(`Web server running at ${webUrl}`);
	 });

	 module.exports = app;

```



 -	localhost [/tmp/tm/notes-manager]$ git diff main..dev -- api/app.js

```
	diff --git a/api/app.js b/api/app.js
	index f62bf66..f1ad0a1 100644
	--- a/api/app.js
	+++ b/api/app.js
	@@ -9,12 +9,25 @@ dotenv.config();
	 const app = express();
	 const port = process.env.PORT || 3000;

	+
	+const webUrl = process.env.WEB_BASE_URL || 'http://localhost:3001';
	+const appUrl = process.env.API_BASE_URL || 'http://localhost:3000';
	+
	+
	+var corsOptions = {
	+  //origin: 'http://app_web',
	+  //origin: '*',
	+  origin: webUrl,
	+  optionsSuccessStatus: 200 // some legacy browsers (IE11, various SmartTVs) choke on 204
	+}
	 // Activer CORS pour toutes les requêtes
	-app.use(cors());
	+app.use(cors(corsOptions));
	+//app.use(cors());

	 app.use(express.json());
	 app.use('/api', notesRouter);

	 app.listen(port, () => {
	+  //console.log(`API listening at ${process.env.API_BASE_URL || `http://localhost:${port}`}`);
	   console.log(`API listening at ${process.env.API_BASE_URL || `http://localhost:${port}`}`);
	 });

```






 ```

localhost [/tmp/tm/notes-manager]$ cat Docker/.env

localhost [/tmp/tm/notes-manager]$ git checkout main web/public/app.js web/public/index.html
Updated 1 path from e4e58d9

localhost [/tmp/tm/notes-manager]$ cp web/public/app.js src/

localhost [/tmp/tm/notes-manager]$ docker run --network docker_default -e API_BASE_URL=http://app_api  -e WEB_BASE_URL=http://app_web   -e DB_USER=notes_user1  -e DB_PASSWORD=notes_user1 -e DB_NAME=notes_manager   -e DB_HOST=mysql  -it  --rm  -v  $(pwd)/src:/home/node/app/src     -v $(pwd)/dist:/home/node/app/dist       -v $(pwd)/web:/home/node/app/web  -v $(pwd)/api:/home/node/app/api  fabstock2/notes_manager:app_one-node ./build.webpack.sh

 ```


 ```
added 71 packages, and audited 537 packages in 8s

52 packages are looking for funding
  run `npm fund` for details

found 0 vulnerabilities

added 29 packages, and audited 566 packages in 6s

62 packages are looking for funding
  run `npm fund` for details

found 0 vulnerabilities
{
  NODE_VERSION: '20.17.0',
  HOSTNAME: '97fceac71e9c',
  YARN_VERSION: '1.22.22',
  WEB_PORT: 'WEB_PORT',
  PORT: '',
  HOME: '/home/node',
  DB_NAME: 'notes_manager',
  MYSQL_ROOT_PASSWORD: 'root',
  TERM: 'xterm',
  DOCKERAPP_VERSION: 'node',
  PATH: '/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:./node_modules/.bin/',
  MARIADB_ROOT_PASSWORD: 'root',
  API_BASE_URL: 'http://app_api',
  TEST_FAB_ENV: '1',
  WEB_BASE_URL: 'http://app_web',
  DB_PASSWORD: 'notes_user1',
  PWD: '/home/node/app',
  DB_HOST: 'mysql',
  DB_USER: 'notes_user1',
  APP_VERSION: '$(npm pkg get version)'
}
asset bundle.js 6.65 KiB [emitted] (name: main)
asset index.html 794 bytes [emitted]
./src/app.js 6.6 KiB [built] [code generated]
webpack 5.94.0 compiled successfully in 300 ms
 ```

 ```
localhost [/tmp/tm/notes-manager]$ dce restart app_api  app_web

 ```

 ```
git checkout main web/public/app.js web/public/index.html
cp web/public/index.html src/index.html.template
cp web/public/app.js src/app.js


localhost [/tmp/tm/notes-manager]$ docker run --network docker_default -e API_BASE_URL=app_api  -e WEB_BASE_URL=app_web   -e DB_USER=notes_user1  -e DB_PASSWORD=notes_user1 -e DB_NAME=notes_manager   -e DB_HOST=mysql  -it  --rm  -v  $(pwd)/src:/home/node/app/src     -v $(pwd)/dist:/home/node/app/dist       -v $(pwd)/web:/home/node/app/web  -v $(pwd)/api:/home/node/app/api  fabstock2/notes_manager:app_one-node ./build.webpack.sh

added 71 packages, and audited 537 packages in 8s

52 packages are looking for funding
  run `npm fund` for details

found 0 vulnerabilities

added 29 packages, and audited 566 packages in 6s

62 packages are looking for funding
  run `npm fund` for details

found 0 vulnerabilities
{
  NODE_VERSION: '20.17.0',
  HOSTNAME: '6c64675fb735',
  YARN_VERSION: '1.22.22',
  WEB_PORT: 'WEB_PORT',
  PORT: '',
  HOME: '/home/node',
  DB_NAME: 'notes_manager',
  MYSQL_ROOT_PASSWORD: 'root',
  TERM: 'xterm',
  DOCKERAPP_VERSION: 'node',
  PATH: '/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:./node_modules/.bin/',
  MARIADB_ROOT_PASSWORD: 'root',
  API_BASE_URL: 'app_api',
  TEST_FAB_ENV: '1',
  WEB_BASE_URL: 'app_web',
  DB_PASSWORD: 'notes_user1',
  PWD: '/home/node/app',
  DB_HOST: 'mysql',
  DB_USER: 'notes_user1',
  APP_VERSION: '$(npm pkg get version)'
}
asset bundle.js 6.64 KiB [emitted] (name: main)
asset index.html 794 bytes [emitted]
./src/app.js 6.6 KiB [built] [code generated]
webpack 5.94.0 compiled successfully in 328 ms


 ```



 ```
docker run --network docker_default -e DB_USER=notes_user1  -e DB_PASSWORD=notes_user1 -e DB_NAME=notes_manager   -e DB_HOST=mysql  -it  --rm  -v  $(pwd)/src:/home/node/app/src     -v $(pwd)/dist:/home/node/app/dist       -v $(pwd)/web:/home/node/app/web  -v $(pwd)/api:/home/node/app/api  fabstock2/notes_manager:app_one-node ./build.webpack.sh

 ```

 ```
  added 71 packages, and audited 537 packages in 7s
  
  52 packages are looking for funding
    run `npm fund` for details
  
  found 0 vulnerabilities
  
  added 29 packages, and audited 566 packages in 6s
  
  62 packages are looking for funding
    run `npm fund` for details
  
  found 0 vulnerabilities
  {
    NODE_VERSION: '20.17.0',
    HOSTNAME: '214435d77d4b',
    YARN_VERSION: '1.22.22',
    WEB_PORT: 'WEB_PORT',
    PORT: '',
    HOME: '/home/node',
    DB_NAME: 'notes_manager',
    MYSQL_ROOT_PASSWORD: 'root',
    TERM: 'xterm',
    DOCKERAPP_VERSION: 'node',
    PATH: '/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:./node_modules/.bin/',
    MARIADB_ROOT_PASSWORD: 'root',
    API_BASE_URL: 'API_BASE_URL',
    TEST_FAB_ENV: '1',
    WEB_BASE_URL: 'WEB_BASE_URL',
    DB_PASSWORD: 'notes_user1',
    PWD: '/home/node/app',
    DB_HOST: 'mysql',
    DB_USER: 'notes_user1',
    APP_VERSION: '$(npm pkg get version)'
  }
  asset bundle.js 6.64 KiB [emitted] (name: main)
  asset index.html 794 bytes [emitted]
  ./src/app.js 6.6 KiB [built] [code generated]
  webpack 5.94.0 compiled successfully in 257 ms
  
 ```
