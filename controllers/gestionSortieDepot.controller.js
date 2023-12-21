const serviceGestionSortieDepot = require("../services/gestionSortieDepot.services");


const statNombreSortie = async (request, response) => {
    try {
        // Récupérer les paramètres debut et fin depuis la requête HTTP
        const debut = request.query.debut ? (request.query.debut) : null;
        const fin = request.query.fin ? (request.query.fin) : null;
        console.log(debut, fin)
        const nombre = await serviceGestionSortieDepot.getNombreSortie(debut, fin);
        const reponse = {
            status: 'Success',
            code: 200,
            message: 'Nombre sortie dépot.',
            data: nombre
        };

        return response.status(200).send(reponse);
    } catch (error) {
        const reponse = {
            status: 'Failed',
            code: 500,
            message: 'Une erreur s\'est produite.',
        };

        return response.status(500).send(reponse);
    }
}

const statNombreSortieDuJour = async (request, response) => {
    try {
        const nombre = await serviceGestionSortieDepot.getNombreSortieDuJour();
        const reponse = {
            status: 'Success',
            code: 200,
            message: 'Nombre sortie dépot du jour.',
            data: nombre
        };

        return response.status(200).send(reponse);
    } catch (error) {
        const reponse = {
            status: 'Failed',
            code: 500,
            message: 'Une erreur s\'est produite.',
        };

        return response.status(500).send(reponse);
    }
}

const insererSortie = async (request, response) => {
    try {
        const { date_sortie, facture_sortie, id_user } = request.body;

        const nouvelleSortie = await serviceGestionSortieDepot.insererSortieDepot(date_sortie, facture_sortie, id_user);

        const reponse = {
            status: 'Success',
            code: 200,
            message: 'Nouvelle sortie dans le dépot.',
            data: nouvelleSortie
        };

        return response.status(200).send(reponse);
    } catch (error) {
        console.error('Erreur dans le insererSortie :', error);
        const reponse = {
            status: 'Failed',
            code: 500,
            message: 'Une erreur s\'est produite.',
        };

        return response.status(500).send(reponse);
    }
}

const listerSortie = async (request, response) => {
    try {
        const debut = request.query.debut ? (request.query.debut) : null;
        const fin = request.query.fin ? (request.query.fin) : null;
        const sortList = request.query.sortList || 'date_desc';
        const page = request.query.page ? parseInt(request.query.page, 10) : null;
        const limitPerPage = request.query.limitPerPage ? parseInt(request.query.limitPerPage, 10) : null;

        const { rows, count } = await serviceGestionSortieDepot.listerSortie(debut, fin, sortList, page, limitPerPage);

        const reponse = {
            status: 'Success',
            code: 200,
            message: 'Liste sortie dans le dépot.',
            data: rows,
            data_count: count
        };

        return response.status(200).send(reponse);
    } catch (error) {
        console.error('Erreur dans le controleurGetAllSortieDepot :', error);
        res.status(500).json({ error: 'Erreur interne du serveur' });
    }
}

const listerSortieSecurite = async (request, response) => {
    try {
        const portails = request.query.portails;
        const debut = request.query.debut ? (request.query.debut) : null;
        const fin = request.query.fin ? (request.query.fin) : null;
        const sortList = request.query.sortList || 'date_desc';
        const page = request.query.page ? parseInt(request.query.page, 10) : null;
        const limitPerPage = request.query.limitPerPage ? parseInt(request.query.limitPerPage, 10) : null;

        const { rows, count } = await serviceGestionSortieDepot.listerCurrentSortieSecurite(portails, debut, fin, sortList, page, limitPerPage);

        const reponse = {
            status: 'Success',
            code: 200,
            message: 'Liste sortie dans le dépot.',
            data: rows,
            data_count: count
        };

        return response.status(200).send(reponse);
    } catch (error) {
        console.error('Erreur dans le controleurGetAllSortieDepot :', error);
        res.status(500).json({ error: 'Erreur interne du serveur' });
    }
}

const listerSortieSecuriteTerminer = async (request, response) => {
    try {
        const portails = request.query.portails;
        const debut = request.query.debut ? (request.query.debut) : null;
        const fin = request.query.fin ? (request.query.fin) : null;
        const sortList = request.query.sortList || 'date_desc';
        const page = request.query.page ? parseInt(request.query.page, 10) : null;
        const limitPerPage = request.query.limitPerPage ? parseInt(request.query.limitPerPage, 10) : null;

        const { rows, count } = await serviceGestionSortieDepot.listerSortieTermineSecurite(portails, debut, fin, sortList, page, limitPerPage);

        const reponse = {
            status: 'Success',
            code: 200,
            message: 'Liste sortie dans le dépot.',
            data: rows,
            data_count: count
        };

        return response.status(200).send(reponse);
    } catch (error) {
        console.error('Erreur dans le controleurGetAllSortieDepot :', error);
        res.status(500).json({ error: 'Erreur interne du serveur' });
    }
}

const validerSecurite1 = async (request, response) => {
    try {
        const { sortie, transport, securite } = request.body;

        const nouvelleSortie = await serviceGestionSortieDepot.validerSecurite1(sortie, transport, securite);

        const reponse = {
            status: 'Success',
            code: 200,
            message: 'validation sortie dans le dépot.',
            data: nouvelleSortie
        };

        return response.status(200).send(reponse);
    } catch (error) {
        console.error('Erreur dans le insererSortie :', error);
        const reponse = {
            status: 'Failed',
            code: 500,
            message: 'Une erreur s\'est produite.',
        };

        return response.status(500).send(reponse);
    }
}


const validerSecurite2 = async (request, response) => {
    try {
        const { sortie, securite } = request.body;

        const nouvelleSortie = await serviceGestionSortieDepot.validerSecurite2(sortie, securite);

        const reponse = {
            status: 'Success',
            code: 200,
            message: 'validation sortie dans le dépot.',
            data: nouvelleSortie
        };

        return response.status(200).send(reponse);
    } catch (error) {
        console.error('Erreur dans le insererSortie :', error);
        const reponse = {
            status: 'Failed',
            code: 500,
            message: 'Une erreur s\'est produite.',
        };

        return response.status(500).send(reponse);
    }
}

const validerSecurite3 = async (request, response) => {
    try {
        const { sortie, securite } = request.body;

        const nouvelleSortie = await serviceGestionSortieDepot.validerSecurite2(sortie, securite);

        const reponse = {
            status: 'Success',
            code: 200,
            message: 'validation sortie dans le dépot.',
            data: nouvelleSortie
        };

        return response.status(200).send(reponse);
    } catch (error) {
        console.error('Erreur dans le insererSortie :', error);
        const reponse = {
            status: 'Failed',
            code: 500,
            message: 'Une erreur s\'est produite.',
        };

        return response.status(500).send(reponse);
    }
}


module.exports = {
    insererSortie,
    listerSortie,
    statNombreSortie,
    statNombreSortieDuJour,
    listerSortieSecurite,
    listerSortieSecuriteTerminer,
    validerSecurite1,
    validerSecurite2,
    validerSecurite3,
}