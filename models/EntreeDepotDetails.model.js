const { DataTypes, Op } = require('sequelize');
const sequelize = require('../configurations/database.configuration');
const moment = require('moment/moment');

const EntreeDepotDetails = sequelize.define('EntreeDepotDetails', {
  numero_entree: {
    type: DataTypes.INTEGER,
    allowNull: false,
    primaryKey: true,
    autoIncrement: true,
  },
  date_entree: {
    type: DataTypes.DATE,
    allowNull: false,
  },
  facture_entree: {
    type: DataTypes.STRING(20),
    allowNull: false,
  },
  id_user: {
    type: DataTypes.INTEGER,
    allowNull: false,
  },
  responsable: {
    type: DataTypes.STRING,
  }
}, {
  tableName: 'entree_depot_details',
  timestamps: false
});

module.exports = EntreeDepotDetails;