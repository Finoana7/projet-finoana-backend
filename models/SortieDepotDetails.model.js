const { DataTypes, Op } = require('sequelize');
const sequelize = require('../configurations/database.configuration');

const SortieDepotDetails = sequelize.define('SortieDepotDetails', {
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
    responsable: {
        type: DataTypes.STRING,
    },
    numero_immatricule: {
        type: DataTypes.STRING(10),
    },
    passage_securite1: {
        type: DataTypes.BOOLEAN,
        defaultValue: false
    },
    passage_securite2: {
        type: DataTypes.BOOLEAN,
        defaultValue: false
    },
    passage_securite3: {
        type: DataTypes.BOOLEAN,
        defaultValue: false
    },
    nombre_validation: {
        type: DataTypes.INTEGER,
        defaultValue: 0
    },
    transport: {
        type: DataTypes.STRING,
    },
}, {
    tableName: 'sortie_depot_details',
    timestamps: false
});

module.exports = SortieDepotDetails;