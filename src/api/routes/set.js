const fs = require('fs');
const resolve = require('path').resolve;
const routesModel = require('./routeSchema');

module.exports = async (app, pathSrc) => {
    let routes = await routesModel.find();
    let path = resolve(pathSrc);
    let controllers = await readDir(path);

    routes.forEach(rt => {
        console.log(`Verbo: ${rt.verbo} -  Rota: /api/${rt.rota} - Controller: ${rt.funcionalidade} - Função: ${rt.metodo}`);
        app[rt.verbo](`/api/${rt.rota}`, handleError(controllers[rt.funcionalidade][rt.metodo])); 
    });
}

function readDir(path, files = {}) {
    path = resolve(path);

    let dir = fs.readdirSync(path);

    dir.forEach(dr => {
        if (fs.lstatSync(`${path}/${dr}`).isDirectory()) {
            readDir(`${path}/${dr}`, files);
        } else {
            if (/Controller/.test(dr))
                files[dr.replace(/Controller.js/, '')] = require(`${path}/${dr}`);
        }
    });

    return files;
}

function handleError(controller) {
    return async (req, res, next) => {
        try {
            await controller(req, res);
        } catch (error) {
            console.error(error);
            return res.error(error, error.statusCode || 500);
        }
    }
}
 