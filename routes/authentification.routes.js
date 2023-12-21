var express = require('express');
const { authentifierUser, authentifierSecurite } = require('../controllers/authentification.controller');
var router = express.Router();

/* GET home page. */
router.get('/', function(req, res, next) {
  res.render('index', { title: 'Express' });
});

router.post('/login', authentifierUser);

router.post('/loginSecurite', authentifierSecurite);

module.exports = router;
