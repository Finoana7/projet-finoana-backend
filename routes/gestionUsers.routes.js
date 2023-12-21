var express = require('express');
const gestionUsersControllers = require('../controllers/gestionUsers.controller');
var router = express.Router();

/* GET users listing. */
router.get('/', gestionUsersControllers.getListPersonnel);

router.get('/depot', gestionUsersControllers.getListResponsableDepot);

router.post('/securite/info', gestionUsersControllers.getSecuriteInformation);

module.exports = router;
