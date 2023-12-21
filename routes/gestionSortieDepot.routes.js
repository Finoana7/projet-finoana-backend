var express = require('express');
const gestionSortieDepotController = require('../controllers/gestionSortieDepot.controller');
var router = express.Router();


router.get('/', gestionSortieDepotController.listerSortie);
router.get('/securite', gestionSortieDepotController.listerSortieSecurite);
router.get('/securite/terminer', gestionSortieDepotController.listerSortieSecuriteTerminer);

router.post('/', gestionSortieDepotController.insererSortie);
router.post('/securite1', gestionSortieDepotController.validerSecurite1);
router.post('/securite2', gestionSortieDepotController.validerSecurite2);
router.post('/securite3', gestionSortieDepotController.validerSecurite3);

router.get('/stats', gestionSortieDepotController.statNombreSortie);
router.get('/dailystats', gestionSortieDepotController.statNombreSortieDuJour);

module.exports = router;
