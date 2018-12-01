const mongoose = require('mongoose');

const routeSchema = new mongoose.Schema({
    "verbo": String,
    "funcionalidade": String,
    "metodo": String,
    "rota": String
});

module.exports = mongoose.model("routes", routeSchema);