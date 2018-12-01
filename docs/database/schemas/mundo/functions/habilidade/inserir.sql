CREATE OR REPLACE FUNCTION mundo.inserirHabilidade(
    pNome mundo.habilidade.nome%TYPE
) RETURNS json
AS $$
    /*
        Documentação
            Arquivo fonte.....: inserir.sql
            Objetivo..........: Inserir uma habilidade no banco
            Autor.............: Thiago Oliveira
            Data..............: 01/12/2018
            Ex................:
                SELECT mundo.inserirHabilidade(nome);
    */
    BEGIN
        IF EXISTS (SELECT id FROM mundo.habilidade WHERE unaccent(nome) ILIKE unaccent(pNome)) THEN
            RETURN json_build_object(
                'message', 'Já existe uma habilidade com este nome',
                'code', 1
            );
        END IF;

        INSERT INTO mundo.habilidade(nome)
            VALUES(pNome);

        RETURN json_build_object(
            'message', 'Salvo com sucesso',
            'code', 0
        );
    END;
$$ LANGUAGE plpgsql;