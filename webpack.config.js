const webpack = require('webpack');
const path = require('path');
const HtmlWebpackPlugin = require('html-webpack-plugin');
//const  HtmlWebpackTagsPlugin = require('html-webpack-tags-plugin');
require('dotenv').config(); // Charger les variables d'environnement depuis le fichier .envc

console.log(process.env);


//const path = require('path');
//const HtmlWebpackPlugin = require('html-webpack-plugin');

module.exports = {
  //mode: 'development', // Mode développement
  mode: 'none', // Mode développement
  entry: './src/app.js', // Point d'entrée de votre application
  output: {
    path: path.resolve(__dirname, 'dist/public/'), // Dossier de sortie
    filename: 'bundle.js', // Nom du fichier JS généré
  },
  plugins: [
     new webpack.DefinePlugin({
      'process.env.API_BASE_URL': JSON.stringify(process.env.API_BASE_URL)
      //'process.env.API_BASE_URL': JSON.stringify('http://localhost:3000')

    }),

    new HtmlWebpackPlugin({
      path: '',
      template: './src/index.html.template', // Chemin vers votre fichier template
      filename: 'index.html', // Nom du fichier HTML généré dans dist
      inject: 'body', // Injecter les scripts juste avant la fermeture de la balise </body>
    }),
  ],
};
