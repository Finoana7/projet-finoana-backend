const { DataTypes, Op } = require('sequelize');
const sequelize = require('../configurations/database.configuration');

const ConfirmationSecurite = sequelize.define('ConfirmationSecurite', {
  numero_sortie: {
    type: DataTypes.INTEGER,
    allowNull: false,
    primaryKey: true,
  },
  numero_portail: {
    type: DataTypes.INTEGER,
    allowNull: false,
    primaryKey: true,
  },
  date_sortie_portail: {
    type: DataTypes.DATE,
    allowNull: false,
  },
  etat_sortie: {
    type: DataTypes.STRING(10),
    allowNull: false,
  },
}, {
  tableName: 'confirmer',
  timestamps: false
});

module.exports = ConfirmationSecurite;