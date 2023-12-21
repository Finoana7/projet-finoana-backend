var express = require('express');
const gestionTransportDepot = require('../controllers/gestionTransportDepot.controller');
var router = express.Router();

/* GET users listing. */
router.get('/', gestionTransportDepot.listerTransport);

module.exports = router;
