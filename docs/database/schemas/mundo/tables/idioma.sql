CREATE TABLE mundo.idioma(
    id serial constraint pk_idioma primary key,
    nome varchar(50) constraint uq_idioma_nome unique
);