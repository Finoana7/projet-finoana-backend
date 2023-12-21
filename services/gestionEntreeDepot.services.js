const { Op } = require("sequelize");
const EntreeDepot = require("../models/EntreeDepot.model");
const EntreeDepotDetails = require("../models/EntreeDepotDetails.model");
const moment = require('moment/moment');

const getNombreEntree = async (debut = null, fin = null) => {
    try {
        const conditions = {};
        const dateDebut = debut ? moment(debut).toDate() : null;
        const dateFin = fin ? moment(fin).toDate() : null;
        console.log(dateDebut, dateFin)
        if (dateDebut && dateFin) {
          conditions.date_entree = {
            [Op.gte]: dateDebut,
            [Op.lte]: dateFin,
          };
        } else if (dateDebut) {
          conditions.date_entree = {
            [Op.gte]: dateDebut,
          };
        } else if (dateFin) {
          conditions.date_entree = {
            [Op.lte]: dateFin,
          };
        }
    
        const nombreEntree = await EntreeDepot.count({
          where: conditions,
        });
    
        return nombreEntree;
      } catch (error) {
        console.error('Erreur lors de la récupération du nombre d\'entrées :', error);
        throw error;
      }
}

const getNombreEntreeDuJour = async () => {
    try {
        const debut = new Date();
        // Réglage de l'heure à minuit
        debut.setHours(0, 0, 0, 0);
        const nombre = await getNombreEntree(debut);
        return nombre;
    } catch (error) {
        throw error;
    }
}

const insererEntree = async (date_entree = new Date(), facture_entree, idReponsable) => {
    try {
        const entreeDepot = await EntreeDepot.create({
			date_entree,
			facture_entree,
			id_user: idReponsable,
        });
    
        return entreeDepot;
      } catch (error) {
        console.error('Erreur lors de l\'insertion de l\'entreeDepot :', error);
        throw error;
      }
}

const getAll = async (debut = null, fin = null, sortList = 'date_desc', page = null, limitPerPage = null) => {
    try {
        const conditions = {};
    
        const dateDebut = debut ? moment(debut).toDate() : null;
        const dateFin = fin ? moment(fin).toDate() : null;
    
        // Ajouter les conditions de date si début et/ou fin sont spécifiés
        if (dateDebut && dateFin) {
            conditions.date_entree = {
                [Op.gte]: dateDebut,
                [Op.lte]: dateFin,
            };
        } else if (dateDebut) {
            conditions.date_entree = {
                [Op.gte]: dateDebut,
            };
        } else if (dateFin) {
            conditions.date_entree = {
                [Op.lte]: dateFin,
            };
        }
    
        // Définir l'ordre de tri
        const order = (sortList === 'date_asc') ? [['date_entree', 'ASC']] : [['date_entree', 'DESC']];
    
        // Configurer la pagination si page et limitPerPage sont spécifiés
        const offset = (page && limitPerPage && page > 0 && limitPerPage > 0) ? (page - 1) * limitPerPage : 0;
        const limit = (limitPerPage && limitPerPage > 0) ? limitPerPage : null;
    
        // Effectuer la recherche avec les conditions, l'ordre et la pagination
        const { rows, count } = await EntreeDepotDetails.findAndCountAll({
            where: conditions,
            order,
            offset,
            limit,
        });
    
        return { rows, count };
    } catch (error) {
        console.error('Erreur lors de la récupération de la liste d\'entrées :', error);
        throw error;
    }
}

module.exports = {
    getNombreEntree,
    getNombreEntreeDuJour,
    insererEntree,
    getAll
}