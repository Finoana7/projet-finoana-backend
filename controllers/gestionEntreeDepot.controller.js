const serviceGestionEntreeDepot = require("../services/gestionEntreeDepot.services");

const statNombreEntree = async (request, response) => {
    try {
        // Récupérer les paramètres debut et fin depuis la requête HTTP
        const debut = request.query.debut ? (request.query.debut) : null;
        const fin = request.query.fin ? (request.query.fin) : null;
        console.log(debut, fin)
        const nombre = await serviceGestionEntreeDepot.getNombreEntree(debut, fin);
        const reponse = {
            status: 'Success',
            code: 200,
            message: 'Nombre entrée dépot.',
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

const statNombreEntreeDuJour = async (request, response) => {
    try {
        const nombre = await serviceGestionEntreeDepot.getNombreEntreeDuJour();
        const reponse = {
            status: 'Success',
            code: 200,
            message: 'Nombre entrée dépot.',
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

const ajouterEntree = async (request, response) => {
    try {
        // Récupérer les données depuis le corps de la requête POST
        const { facture, idresponsable, date_entree } = request.body;
        // Valider les données si nécessaire

        // Appeler la fonction statique pour l'insertion dans la base de données
        const entreeDepot = await serviceGestionEntreeDepot.insererEntree(date_entree, facture, idresponsable);

        const reponse = {
            status: 'Success',
            code: 200,
            message: 'Nouvelle entrée dans le dépot.',
            data: entreeDepot
        };

        return response.status(200).send(reponse);
    } catch (error) {
        console.log(error);
        const reponse = {
            status: 'Failed',
            code: 500,
            message: 'Une erreur s\'est produite.',
        };

        return response.status(500).send(reponse);
    }
}

const getListEntree = async (request, response) => {
    try {
        // Récupérer les paramètres depuis la requête HTTP
        const debut = request.query.debut ? (request.query.debut) : null;
        const fin = request.query.fin ? (request.query.fin) : null;
        const sortList = request.query.sortList || 'date_desc';
        const page = request.query.page ? parseInt(request.query.page, 10) : null;
        const limitPerPage = request.query.limitPerPage ? parseInt(request.query.limitPerPage, 10) : null;

        // Appeler la fonction statique getAll avec les paramètres
        const { rows, count } = await serviceGestionEntreeDepot.getAll(debut, fin, sortList, page, limitPerPage);

        const reponse = {
            status: 'Success',
            code: 200,
            message: 'Liste des entrées dans le dépot.',
            data: rows,
            data_count: count
        };

        return response.status(200).send(reponse);
    } catch (error) {
        console.log(error);
        const reponse = {
            status: 'Failed',
            code: 500,
            message: 'Une erreur s\'est produite.',
        };

        return response.status(500).send(reponse);
    }
}

module.exports = {
    statNombreEntree,
    statNombreEntreeDuJour,
    ajouterEntree,
    getListEntree
}