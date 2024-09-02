


 #  This is a Poor Man Pipeline.
 ##   Slow ,No Optimize & Not for Safe Work 
 ### Pipeline for learning
 

 ## The most Famous Action Github 

 ### actions/checkout@v4
 - https://github.com/actions/checkout

 ## ACT The good friend 
  - https://github.com/nektos/acthttps://github.com/nektos/act
  
 ``` bash
  /home/fab/bin/act -s  GITHUB_TOKEN=ghp_gxFaZa*JaaaaaaaaV-dwbbbbFllae2sS2d4ala9w  -W  .github/workflows/run_test.yml --defaultbranch dev

INFO[0000] Using docker host 'unix:///var/run/docker.sock', and daemon socket 'unix:///var/run/docker.sock'
[Build (image docker) , Test (npm jest),
Push and Deploy with Docker Compose Containers on ...
This is a poor man pipeline  ,
and  Not Optimize & not Secure pipeline for learning
/Build Docker Image & TestS npm jest from docker run  & Push Registry  fabstock2/notes_manager:app_one-node] 🚀  Start image=catthehacker/ubuntu:act-latest
[Build (image docker) , Test (npm jest),
/Build Docker Image & TestS npm jest from docker run  & Push Registry  fabstock2/notes_manager:app_one-node]   🐳  docker create image=catthehacker/ubuntu:act-latest platform= entrypoint=["tail" "-f" "/
.
..
...
```   

 ## And the Ugly Bastards 

 #### Github Action(s)

  - https://github.com/actions/cache
  - https://github.com/marketplace/actions/start-mariadb

 
#### Docker actions

  - https://docs.docker.com/build/ci/github-actions/configure-builder/
  - https://github.com/docker/build-push-action
  - https://github.com/docker/setup-buildx-action



 ####  Ansible/action

  - https://github.com/dawidd6/action-ansible-playbook
  - .... 

 ####  simple action 
  - https://github.com/EthanSK/git-branch-name-action
    https://github.com/marketplace/actions/git-branch-name




 ### and most bash  isn't it !
  ##### ( it's not modern !)

 ### Others: man on work ...!
  
  - if test or and 
  - secrets variables , environment 
    * eat your own dog food
 

  à étudier 
  - uses: getong/mariadb-action@v1.11 )
  -  https://docs.github.com/en/actions/using-github-hosted-runners/using-github-hosted-runners/about-github-hosted-runners#creating-and-using-secrets-encrypted-variables   
  - https://github.com/appleboy/ssh-action
  
  - https://www.baeldung.com/linux/docker-compose-check-container-running
    
  - docker inspect --format "{{.State.Status}}" app_api
```yaml 
running
```
 - inspect ... 
```
   
  docker inspect --format "{{.NetworkSettings.Networks.docker_default.IPAddress}}" app_api
```yaml
172.20.0.3
```

  - with jq
```
  docker inspect app_api  |  jq ".[].NetworkSettings.Networks.docker_default.IPAddress"
    (avec quotes ")
```

```yaml
"172.20.0.3"
```
   
 ## Jest npm test

 -  efface la db éxistante
 -  test écriture dans la db 2 

 ```

docker run --network docker_default  -e DB_USER=notes_user1  -e DB_PASSWORD=notes_user1 -e DB_NAME=notes_manager   -e DB_HOST=mysql  -t  --rm  -v $(pwd)/api:/home/node/app/api   fabstock2/notes_manager:app_one-node  jest

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







 ## Deployement with Ansible 

  - ansible/actions

```yaml

- name: Run Ansible Playbook
        uses: ansible/ansible-action@v2
        with:
          playbook: ansible/deploy.yml
        env:
          ANSIBLE_HOST: ${{ secrets.ANSIBLE_HOST }}
          ANSIBLE_USER: ${{ secrets.ANSIBLE_USER }}
          ANSIBLE_SSH_KEY: ${{ secrets.ANSIBLE_SSH_KEY }}

      - name: Setting up SSH key
        run: |
        echo "${{ secrets.SSH_PRIVATE_KEY }}" > private_key.pem
        chmod 600 private_key.pem
      - name: Run Ansible Playbook
        run: |
        sudo apt update
        sudo apt install -y ansible
        ansible-playbook -i hosts.ini my-playbook.yml --private-key=private_key.pem --user=${{ secrets.ANSIBLE_USER }}

```

  ### Deploy with ssh key (passphrase .... ) 

 ```bash
    localhost [/tmp/tm/notes-manager]$ cat ansible/deploy
 ```

 ```yaml
- name: Deploy Docker Container
  hosts: all
  become: no
  tasks:

  - name:  Start
    shell: echo $(date)

  - name: docker container 
    shell: docker ps -a

 ```

  
 ### Clone a Private Repository  from Github  with ssh key  

 ```bash
 localhost [/tmp/tm/notes-manager]$ cat ansible/clone.yml
 ```

 ```yaml
- name: Clone Private Github
  hosts: localhost

  become: no
  tasks:


  - Clone a private Repository 

  - name: Clone a private repository into .depot.
    git:
      #repo: https://github.com/fabstock/notes-manager
      repo: git@github.com:fabstock/notes-manager.git
      #version: master
      dest:  ./deploy/
      #single_branch:
      #key_file:
      separate_git_dir: notes_manager_dev
      accept_hostkey: yes
    # ssh-agent doesn't allow key to pass through remote sudo commands.
    become: no

```

 ### Clone Repository with path or fine grained token (à suivre)

```bash
   git clone https://PAT@github.com/<your account or organization>/<repo>.git
   git config credential.helper store 

```
  
 ## Webpack Just One Time 
  10 years after ... 
   -  https://fr.wikipedia.org/wiki/Webpack

      ( 10 mars 2012)

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
```javascript
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

```bash
 -	localhost [/tmp/tm/notes-manager]$ git diff main..dev -- api/app.js
```

```javascript
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






```bash

localhost [/tmp/tm/notes-manager]$ cat Docker/.env

localhost [/tmp/tm/notes-manager]$ git checkout main web/public/app.js web/public/index.html
Updated 1 path from e4e58d9

localhost [/tmp/tm/notes-manager]$ cp web/public/app.js src/

localhost [/tmp/tm/notes-manager]$ docker run --network docker_default -e API_BASE_URL=http://app_api  -e WEB_BASE_URL=http://app_web   -e DB_USER=notes_user1  -e DB_PASSWORD=notes_user1 -e DB_NAME=notes_manager   -e DB_HOST=mysql  -it  --rm  -v  $(pwd)/src:/home/node/app/src     -v $(pwd)/dist:/home/node/app/dist       -v $(pwd)/web:/home/node/app/web  -v $(pwd)/api:/home/node/app/api  fabstock2/notes_manager:app_one-node ./build.webpack.sh
```





## TODO : 
  - Workflows:
   .... 
  * Pull request 
  * Templating 
  * Auto workflows 
    - tag commit push      
  * Made a simple action/..
  * Reusable workflow 
  * Import repository to gitlab 
     - New worflow Pipeline 
  * Infra de déploiment 
     - is_Prod & is_Stage 


## This is the end ...  to be ... last or least