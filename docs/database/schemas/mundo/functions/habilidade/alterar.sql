CREATE OR REPLACE FUNCTION mundo.alterarHabilidade(
    pId   mundo.habilidade.id%TYPE,
    pNome mundo.habilidade.nome%TYPE
) RETURNS json
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
        IF EXISTS (SELECT id FROM mundo.habilidade WHERE unaccent(nome) ILIKE unaccent(pNome)) THEN
            RETURN json_build_object(
                'message', 'Já existe uma habilidade com este nome',
                'code', 1
            );
        END IF;

        UPDATE mundo.habilidade
            SET nome = pNome
        WHERE id = pId;

        RETURN json_build_object(
            'message', 'Alterado com sucesso',
            'code', 0
        );
    END;
$$ LANGUAGE plpgsql;