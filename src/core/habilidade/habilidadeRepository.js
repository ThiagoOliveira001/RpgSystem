const config = require('../../../config/config');
const pg = require('smn-pg')(config.settings.postgres);

module.exports = {
    inserir,
    selecionar,
    alterar,
    deletar
};

const procedures = {
    inserir: 'mundo.inserirHabilidade',
    selecionar: 'mundo.selecionarHabilidades',
    alterar: 'mundo.alterarHabilidade',
    deletar: 'mundo.deletarHabilidade'
};

async function inserir(params) {
    return await pg.request()
        .input('pNome', params.nome)
        .asyncExecOne(procedures.inserir);   
}

async function selecionar(params) {
    return await pg.request()
        .input('pNome', params.nome)
        .asyncExec(procedures.selecionar);
}

async function alterar(params) {
    return await pg.request()
        .input('pId', params.id)
        .input('pNome', params.nome)
        .asyncExecOne(procedures.alterar);
}

async function deletar(params) {
    await pg.request()
        .input('pId', params.id)
        .asyncExecOne(procedures.deletar);
}