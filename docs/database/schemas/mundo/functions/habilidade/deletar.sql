CREATE OR REPLACE FUNCTION mundo.deletarHabilidade(
    pId mundo.habilidade.id%TYPE
) RETURNS void 
AS $$
    /*
        Documentacao
            Arquivo fonte.....: deletar.sql
            Objetivo..........: Deletar uma habilidade do banco
            Autor.............: Thiago Oliveira
            Data..............: 01/12/2018
            Ex................:
                SELECT mundo.deletarHabilidade(id);
    */
    BEGIN
        DELETE FROM mundo.habilidade
        WHERE id = pId;
    END;
$$ LANGUAGE plpgsql;