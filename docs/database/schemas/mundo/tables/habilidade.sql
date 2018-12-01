CREATE TABLE mundo.habilidade(
    id serial constraint pk_habilidade primary key,
    nome varchar(50) constraint uq_habilidade_nome unique
);