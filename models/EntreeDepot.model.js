const { DataTypes, Op } = require('sequelize');
const sequelize = require('../configurations/database.configuration');

const EntreeDepot = sequelize.define('EntreeDepot', {
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
}, {
  tableName: 'entree_depot',
  timestamps: false
});

module.exports = EntreeDepot;