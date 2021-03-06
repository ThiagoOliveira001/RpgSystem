const repository = require('./idiomaRepository');
const scope = require('./idiomaScope');

module.exports = {
    inserir,
    selecionar,
    alterar,
    deletar
};

async function inserir(req, res) {
    let params = {
        nome: req.body.nome
    };
    await scope.isValid(params);
    let result = await repository.inserir(params);
    if (result.code == 1)
        return res.error(result, 400);
    res.ok(result, 201);
}

async function selecionar(req, res) {
    let params = {
        nome: req.query.nome || null,
        qtde: req.query.qtde,
        page: req.query.page
    };
    let result = await repository.selecionar(params);
    res.ok(result);
}

async function alterar(req, res) {
    let params = {
        nome: req.body.nome,
        id: req.body.id
    };
    await scope.isValid(params);
    let result = await repository.alterar(params);
    if (result.code == 1)
        return res.error(result, 400);
    res.ok(result);
}

async function deletar(req, res) {
    let params = {
        id: req.query.id
    };
    await repository.deletar(params);
    res.ok({ message: 'Deletado com sucesso' });
}