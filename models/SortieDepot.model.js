const { DataTypes, Op } = require('sequelize');
const sequelize = require('../configurations/database.configuration');

const SortieDepot = sequelize.define('SortieDepot', {
    numero_sortie: {
        type: DataTypes.INTEGER,
        allowNull: false,
        primaryKey: true,
        autoIncrement: true,
    },
    date_sortie: {
        type: DataTypes.DATE,
        allowNull: false,
    },
    facture_sortie: {
        type: DataTypes.STRING(20),
        allowNull: false,
    },
    id_user: {
        type: DataTypes.INTEGER,
        allowNull: false,
    },
    numero_immatricule: {
        type: DataTypes.STRING(10),
    },
}, {
    tableName: 'sortie_depot',
    timestamps: false
});

module.exports = SortieDepot;