CREATE OR REPLACE FUNCTION mundo.alterarIdioma(
    pId mundo.idioma.id%TYPE,
    pNome mundo.idioma.nome%TYPE
) RETURNS json
AS $$
    /*
        Documentação
            Arquivo fonte.....: alterar.sql
            Objetivo..........: Alterar um idioma do banco
            Autor.............: Thiago Oliveira
            Data..............: 02/12/2018
            Ex................:
                SELECT mundo.alterarIdioma(id,nome);
    */
    BEGIN
        IF EXISTS (SELECT id FROM mundo.idioma WHERE unaccent(nome) ILIKE unaccent(pNome)) THEN
            RETURN json_build_object(
                'message', 'Já existe um idioma com este nome',
                'code', 1
            );
        END IF;

        UPDATE mundo.idioma
            SET nome = pNome
        WHERE id = pId;

        RETURN json_build_object(
            'message', 'Alterado com sucesso',
            'code', 0
        );
    END;
$$ LANGUAGE plpgsql;