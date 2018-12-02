CREATE OR REPLACE FUNCTION mundo.deletarIdioma(
    pId mundo.idioma.id%TYPE
) RETURNS void 
AS $$
    /*
        Documentação
            Arquivo fonte.....: deletar.sql
            Objetivo..........: Deletar um idioma do banco
            Autor.............: Thiago Oliveira
            Data..............: 02/12/2018
            Ex................:
                SELECT mundo.deletarIdioma(id);
    */
    BEGIN
        DELETE FROM mundo.idioma
        WHERE id = pId;
    END;
$$ LANGUAGE plpgsql;