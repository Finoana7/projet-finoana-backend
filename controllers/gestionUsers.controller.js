const serviceGestionUsers = require("../services/gestionUsers.services")

const getListPersonnel = async (request, response) => {
    try {
        const listPersonne = await serviceGestionUsers.getListPersonne();
        const reponse = {
            status: 'Success',
            code: 200,
            message: 'liste des utilisateurs.',
            data: listPersonne
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

const getListResponsableDepot = async (request, response) => {
    try {
        const listPersonne = await serviceGestionUsers.getListResponsableDepot();
        const reponse = {
            status: 'Success',
            code: 200,
            message: 'liste des responsables.',
            data: listPersonne
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

const getSecuriteInformation = async (request, response) => {
    try {
        const { id } = request.body;
        const user = await serviceGestionUsers.getSecuriteInformationFromId(id);
        const reponse = {
            status: 'Success',
            code: 200,
            message: 'information d\'un personnel .',
            data: user
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

module.exports = {
    getListPersonnel,
    getListResponsableDepot,
    getSecuriteInformation
}