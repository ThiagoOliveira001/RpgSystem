const Scope = require('smn-schema-validator');

module.exports = {
    isValid
}

async function isValid(params) {
    const validation = {
        nome: {
            required: true,
            type: String,
            maxLength: 50,
            minLenght: 3
        }
    };

    new Scope(params,validation);
}