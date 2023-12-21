const TransportDepot = require("../models/TransportDepot.model");

const listerTransport = async () => {
    try {
        const transport = await TransportDepot.findAll();
        return transport;
    } catch (error) {
        console.error(error);
        throw error;
    }
};


module.exports = {
    listerTransport
}