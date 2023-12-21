var express = require('express');
var router = express.Router();

var usersRouter = require('./gestionUsers.routes');
var authentificationRouter = require('./authentification.routes');
var gestionEntreeDepotRouter = require('./gestionEntreeDepot.routes');
var gestionSortieDepotRouter = require('./gestionSortieDepot.routes');
var gestionTransportDepot = require('./gestionTransportDepot.routes');

router.use('/auth', authentificationRouter);
router.use('/api/users', usersRouter);
router.use('/api/depot/entree', gestionEntreeDepotRouter);
router.use('/api/depot/sortie', gestionSortieDepotRouter);
router.use('/api/depot/responsable', gestionEntreeDepotRouter);
router.use('/api/depot/transport', gestionTransportDepot);

module.exports = router;


