const settings = require('./environment/settings');
const mongoose = require('mongoose');
const response = require('../src/api/middlewares/response');

let obj = {
    settings,
    response,
    init: async () => {
        await mongoose.connect(settings.mongo.getUri(), settings.mongo.options);
        
        let paramsSchema = new mongoose.Schema();
        let model = mongoose.model('parameters', paramsSchema, "parameters");
        let parameters = await model.findOne();
        Object.assign(obj.settings, parameters._doc);
    }
};

module.exports = obj;