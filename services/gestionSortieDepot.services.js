const { Op } = require("sequelize");
const SortieDepot = require("../models/SortieDepot.model");
const SortieDepotDetails = require("../models/SortieDepotDetails.model");
const moment = require('moment/moment');
const { getSecuriteInformationFromId } = require("./gestionUsers.services");
const ConfirmationSecurite = require("../models/ConfirmationSecurite.model");



const insererSortieDepot = async (date_sortie, facture_sortie, id_user) => {
    try {
        // Appeler la méthode create du modèle SortieDepot pour insérer une nouvelle sortie
        const nouvelleSortie = await SortieDepot.create({
            date_sortie,
            facture_sortie,
            id_user
        });
    
        return nouvelleSortie;
    } catch (error) {
        console.error('Erreur lors de l\'insertion de la sortie dans le dépot :', error);
        throw error;
    }
}

const addTransport = async (id_sortie, id_transport) => {
    try {
        const updateMe = await SortieDepot.findByPk(id_sortie);
        updateMe.set('numero_immatricule', id_transport);
        return await updateMe.save();
    } catch (error) {
        throw error;
    }
}

const addTraceSecurite = async (id_sortie, id_portail) => {
    try {
        const current_date = new Date().toLocaleString('fr-FR', { timeZone: 'Africa/Nairobi' });
        const inserted = await ConfirmationSecurite.create({
            numero_sortie: id_sortie,
            numero_portail: id_portail,
            date_sortie_portail: current_date,
            etat_sortie: ''
        });
        return inserted;
    } catch (error) {
        throw error;
    }
}

const validerSecurite1 = async (id_sortie, id_transport, id_securite) => {
    try {
        const securite = await getSecuriteInformationFromId(id_securite);
        const addTransp = await addTransport(id_sortie, id_transport);
        const addTrace = await addTraceSecurite(id_sortie, securite.numero_portail);
        return {
            sortie: addTransp,
            trace: addTrace
        }
    } catch (error) {
        console.log(error)
        throw error;
    }
}

const validerSecurite2 = async (id_sortie, id_securite) => {
    try {
        const securite = await getSecuriteInformationFromId(id_securite);
        const addTrace = await addTraceSecurite(id_sortie, securite.numero_portail);
        return addTrace;
    } catch (error) {
        console.log(error)
        throw error;
    }
}

const listerSortie = async (debut = null, fin = null, sortList = 'date_desc', page = null, limitPerPage = null) => {
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
    
        // Définir l'ordre de tri
        const order = (sortList === 'date_asc') ? [['date_sortie', 'ASC']] : [['date_sortie', 'DESC']];
    
        // Configurer la pagination si page et limitPerPage sont spécifiés
        const offset = (page && limitPerPage && page > 0 && limitPerPage > 0) ? (page - 1) * limitPerPage : 0;
        const limit = (limitPerPage && limitPerPage > 0) ? limitPerPage : null;
    
        // Effectuer la recherche avec les conditions, l'ordre et la pagination
        const { rows, count } = await SortieDepotDetails.findAndCountAll({
            where: conditions,
            order,
            offset,
            limit,
        });
    
        return { rows, count };
    } catch (error) {
        console.error('Erreur lors de la récupération de la liste de sorties :', error);
        throw error;
    }
};

const listerCurrentSortieSecurite = async (portails, debut = null, fin = null, sortList = 'date_desc', page = null, limitPerPage = null) => {
    try {
        const conditions = {
            nombre_validation: portails
        };
    
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
    
        // Définir l'ordre de tri
        const order = (sortList === 'date_asc') ? [['date_sortie', 'ASC']] : [['date_sortie', 'DESC']];
    
        // Configurer la pagination si page et limitPerPage sont spécifiés
        const offset = (page && limitPerPage && page > 0 && limitPerPage > 0) ? (page - 1) * limitPerPage : 0;
        const limit = (limitPerPage && limitPerPage > 0) ? limitPerPage : null;
    
        // Effectuer la recherche avec les conditions, l'ordre et la pagination
        const { rows, count } = await SortieDepotDetails.findAndCountAll({
            where: conditions,
            order,
            offset,
            limit,
        });
    
        return { rows, count };
    } catch (error) {
        console.error('Erreur lors de la récupération de la liste de sorties :', error);
        throw error;
    }
};

const listerSortieTermineSecurite = async (portails, debut = null, fin = null, sortList = 'date_desc', page = null, limitPerPage = null) => {
    try {
        const conditions = {
            nombre_validation: {
                [Op.gte]: portails
            }
        };
    
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
    
        // Définir l'ordre de tri
        const order = (sortList === 'date_asc') ? [['date_sortie', 'ASC']] : [['date_sortie', 'DESC']];
    
        // Configurer la pagination si page et limitPerPage sont spécifiés
        const offset = (page && limitPerPage && page > 0 && limitPerPage > 0) ? (page - 1) * limitPerPage : 0;
        const limit = (limitPerPage && limitPerPage > 0) ? limitPerPage : null;
    
        // Effectuer la recherche avec les conditions, l'ordre et la pagination
        const { rows, count } = await SortieDepotDetails.findAndCountAll({
            where: conditions,
            order,
            offset,
            limit,
        });
    
        return { rows, count };
    } catch (error) {
        console.error('Erreur lors de la récupération de la liste de sorties :', error);
        throw error;
    }
};

const getNombreSortie = async (debut = null, fin = null) => {
    try {
        const conditions = {};
        const dateDebut = debut ? moment(debut).toDate() : null;
        const dateFin = fin ? moment(fin).toDate() : null;
        console.log(dateDebut, dateFin)
        if (dateDebut && dateFin) {
            conditions.date_sortie = {
                [Op.gte]: dateDebut,
                [Op.lte]: dateFin,
            };
        } else if (dateDebut) {
            conditions.date_sortie = {
                [Op.gte]: dateDebut,
            };
        } else if (dateFin) {
            conditions.date_sortie = {
                [Op.lte]: dateFin,
            };
        }
    
        const nombreEntree = await SortieDepot.count({
            where: conditions,
        });
    
        return nombreEntree;
    } catch (error) {
        console.error('Erreur lors de la récupération du nombre d\'entrées :', error);
        throw error;
    }
}

const getNombreSortieDuJour = async () => {
    try {
        const debut = new Date().toLocaleString('fr-FR', { timeZone: 'Africa/Nairobi' });
        // Réglage de l'heure à minuit
        debut.setHours(0, 0, 0, 0);
        const nombre = await getNombreSortie(debut);
        return nombre;
    } catch (error) {
        throw error;
    }
}

module.exports = {
    insererSortieDepot,
    listerSortie,
    listerCurrentSortieSecurite,
    listerSortieTermineSecurite,
    getNombreSortie,
    getNombreSortieDuJour,
    validerSecurite1,
    validerSecurite2,
}