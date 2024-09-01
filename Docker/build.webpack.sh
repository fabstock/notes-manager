#/bin/sh
set -e 

mkdir -p src 
cp web/public/index.html src/index.html.template
cp web/public/app.js src/

ln -f -s web dist


sed -i '/<script src="app.js"><\/script>/d' src/index.html.template

sed -i "s|'http:\/\/localhost\:3000';|process.env.API_BASE_URL;|" src/app.js 
sed -i '/const apiUrl = process.env.API_BASE_URL;/a\
  console.log(`API URL is: ${apiUrl}`);
' src/app.js


npm install --save-dev webpack webpack-cli
npm install --save-dev html-webpack-plugin

#//recupere le variable API_BASE_URL et colle un bundle.js dans public

webpack --config webpack.config.js

