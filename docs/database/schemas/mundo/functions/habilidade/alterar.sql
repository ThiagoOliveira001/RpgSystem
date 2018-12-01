CREATE OR REPLACE FUNCTION mundo.alterarHabilidade(
    pId   mundo.habilidade.id%TYPE,
    pNome mundo.habilidade.nome%TYPE
) RETURNS void
AS $$
    /*
        Documentacao
            Arquivo fonte.....: alterar.sql
            Objetivo..........: Alterar uma habilidade do banco
            Autor.............: Thiago Oliveira
            Data..............: 01/12/2018
            Ex................:
                SELECT mundo.alterarHabilidade(id,nome);
    */
    BEGIN
        UPDATE mundo.habilidade
            SET nome = pNome
        WHERE id = pId;
    END;
$$ LANGUAGE plpgsql;