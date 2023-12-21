const serviceGestionTransportDepot = require("../services/gestionTransportDepot.services");

const listerTransport = async (request, response) => {
    try {
        const transport = await serviceGestionTransportDepot.listerTransport();
        const reponse = {
            status: 'Success',
            code: 200,
            message: 'Liste transport.',
            data: transport
        };

        return response.status(200).send(reponse);
    } catch (error) {
        console.error('Erreur dans le listertransport :', error);
        const reponse = {
            status: 'Failed',
            code: 500,
            message: 'Une erreur s\'est produite.',
        };

        return response.status(500).send(reponse);
    }
}

module.exports = {
    listerTransport
}