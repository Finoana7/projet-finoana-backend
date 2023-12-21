const { DataTypes, Op } = require('sequelize');
const sequelize = require('../configurations/database.configuration');

const TransportDepot = sequelize.define('TransportDepot', {
    numero_immatricule: {
        type: DataTypes.INTEGER,
        allowNull: false,
        primaryKey: true,
        autoIncrement: true,
    },
    designe_transport: {
        type: DataTypes.STRING,
        allowNull: false,
    },
}, {
    tableName: 'transport_depot',
    timestamps: false
});

module.exports = TransportDepot;