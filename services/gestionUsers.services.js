const ResponsableDepot = require("../models/ResponsableDepot.model");
const SecuritePortails = require("../models/SecuritePortails.model");
const User = require("../models/User.model");
const UserDetails = require("../models/UserDetails.model");

const getListPersonne = async () => {
    try {
        const user = await UserDetails.findAll();
        if (!user) {
        throw new Error('List not found');
        }
        return user;
    } catch (error) {
        console.log(error);
        throw error;
    }
}

const getListResponsableDepot = async () => {
    try {
        const user = await ResponsableDepot.findAll();
        if (!user) {
            throw new Error('List not found');
        }
        return user;
    } catch (error) {
        console.log(error);
        throw error;
    }
}

const getSecuriteInformationFromId = async (id) => {
    try {
        const user = await SecuritePortails.findByPk(id);
        if (!user) {
            throw new Error('List not found');
        }
        return user;
    } catch (error) {
        console.log(error);
        throw error;
    }
}

module.exports = {
    getListPersonne,
    getListResponsableDepot,
    getSecuriteInformationFromId
}