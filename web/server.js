const express = require('express');
const path = require('path');
const dotenv = require('dotenv');
const cors = require('cors');

dotenv.config();

// Convertir l'URL du fichier en chemin absolu
 __filename = __filename || path.basename(__filename);
 __dirname = path.dirname(__filename);

const app = express();
const port = process.env.WEB_PORT || 3001;


const webUrl = process.env.WEB_BASE_URL || 'http://localhost:3001';
const appUrl = process.env.API_BASE_URL || 'http://localhost:3000';




var corsOptions = {
    //origin: 'http://app_web',
    //origin: '*',
  origin: webUrl,
  optionsSuccessStatus: 200 // some legacy browsers (IE11, various SmartTVs) choke on 204
}
/
// Activer CORS pour toutes les requêtes
app.use(cors(corsOptions));
//app.use(cors());





// Servir les fichiers statiques du dossier 'public'
app.use(express.static(path.join(__dirname, 'public')));

app.listen(port, () => {
  //console.log(`Web server running at http://localhost:${port}`);
  console.log(`Web server running at ${webUrl}`);
});

module.exports = app;
