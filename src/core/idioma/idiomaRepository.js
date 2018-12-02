const config = require('../../../config/config');
const pg = require('smn-pg')(config.settings.postgres);

module.exports = {
    inserir,
    selecionar,
    alterar,
    deletar
};

const procedures = {
    inserir: 'mundo.inserirIdioma',
    selecionar: 'mundo.selecionarIdiomas',
    alterar: 'mundo.alterarIdioma',
    deletar: 'mundo.deletarIdioma'
};

async function  inserir(params) {
    return await pg.request()
        .input('pNome', params.nome)
        .asyncExecOne(procedures.inserir);
}

async function selecionar(params) {
    return await pg.request()
        .input('pNome', params.nome)
        .input('pQtde', params.qtde)
        .input('pPage', params.page)
        .asyncExecOne(procedures.selecionar);
}

async function alterar(params) {
    return await pg.request()
        .input('pNome', params.nome)
        .input('pId', params.id)
        .asyncExecOne(procedures.alterar);
}

async function deletar(params) {
    await pg.request()
        .input('pId', params.id)
        asyncExecOne(procedures.deletar);
}