const Scope = require('smn-schema-validator');

module.exports = {
    isValid
};

async function  isValid(params) {
    const validation = {
        nome: {
            required: true,
            type: String,
            minLength: 3,
            maxLength: 50
        }
    };

    new Scope(params, validation);
}