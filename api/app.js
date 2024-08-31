const express = require('express');
const dotenv = require('dotenv');
const cors = require('cors');
const notesRouter = require('./routes/notes.js');

// Charger les variables d'environnement depuis le fichier .env
dotenv.config();

const app = express();
const port = process.env.PORT || 3000;


const webUrl = process.env.WEB_BASE_URL || 'http://localhost:3001';
const appUrl = process.env.API_BASE_URL || 'http://localhost:3000';


var corsOptions = {
  //origin: 'http://app_web',
  //origin: '*',
  origin: webUrl,
  optionsSuccessStatus: 200 // some legacy browsers (IE11, various SmartTVs) choke on 204
}
// Activer CORS pour toutes les requêtes
app.use(cors(corsOptions));
//app.use(cors());

app.use(express.json());
app.use('/api', notesRouter);

app.listen(port, () => {
  //console.log(`API listening at ${process.env.API_BASE_URL || `http://localhost:${port}`}`);
  console.log(`API listening at ${process.env.API_BASE_URL || `http://localhost:${port}`}`);
});
