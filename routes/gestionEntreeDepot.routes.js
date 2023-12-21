var express = require('express');
const gestionEntreeDepotController = require('../controllers/gestionEntreeDepot.controller');
var router = express.Router();

/* GET home page. */
router.get('/', gestionEntreeDepotController.getListEntree );

router.post('/', gestionEntreeDepotController.ajouterEntree);

router.get('/stats', gestionEntreeDepotController.statNombreEntree);
router.get('/dailystats', gestionEntreeDepotController.statNombreEntreeDuJour);


module.exports = router;
