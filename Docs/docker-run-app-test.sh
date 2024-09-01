docker network create notes-manager

https://mariadb.com/kb/en/installing-and-using-mariadb-via-docker/





# volume name provided: this is a named volume
-v volume-name:/destination-path/in/container

# no name: this is an anonymous volume
-v /destination-path/in/container

# named volume with options 
--mount type=bind,src=/path/on/host,dest=/destination-path/in/container

# no name: this is an anonymous volume
--mount type=volume,dest=/destination-path/in/container








#docker  build  -f Dockerfile -t fabstock2/notes_manager   .

docker  build  -f Dockerfile -t fabstock2/notes_manager   . --build-arg DB_NAME=notes_manager --build-arg DB_HOST=mysql --build-arg DB_USER=notes_user1 --build-arg DB_PASSWORD=notes_user1



#docker run  --rm  --network host   -e  DB_HOST=localhost  -e DB_USER=notes_user1 -e DB_NAME=notes_manager -e DB_PASSWORD=notes_user1 -it -v $(pwd)/api:/app/api -v $(pwd)/web:/app/web  --name=test_app fabstock2/notes_manager  



#docker run  --rm  --network host   -e  DB_HOST=localhost  -e DB_USER=notes_user1 -e DB_NAME=notes_manager -e DB_PASSWORD=notes_user1 -it -v $(pwd)/api:/app/api -v $(pwd)/web:/app/web  --name=test_app notes-manager-main-app


docker run  --rm  --network notes-manager   -e  DB_HOST=localhost  -e DB_USER=notes_user1 -e DB_NAME=notes_manager -e DB_PASSWORD=notes_user1 -it -v $(pwd)/api:/app/api -v $(pwd)/web:/app/web  --name=test_app fabstock2/notes_manager  /bin/sh


docker run  --rm  --network notes-manager   -e  DB_HOST=mysql   -e DB_USER=notes_user1 -e DB_NAME=notes_manager -e DB_PASSWORD=notes_user1 -it -v $(pwd)/api:/app/api -v $(pwd)/web:/app/web  --name=test_app fabstock2/notes_manager  jest


