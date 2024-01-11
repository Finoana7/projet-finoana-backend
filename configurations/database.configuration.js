const { Sequelize } = require("sequelize");


const hostname = 'localhost';
const port = 3306;
const database_name = 'dbdzama';
const username = 'root';
const password = '';

const sequelize = new Sequelize(
    database_name, 
    username, 
    password, 
    {
        host: hostname,
        dialect: 'mysql'
    }
);

module.exports = sequelize;