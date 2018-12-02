CREATE OR REPLACE FUNCTION mundo.inserirIdioma(
    pNome mundo.idioma.nome%TYPE
) RETURNS json
AS $$ 
    /*
        Documentação
            Arquivo fonte.....: inserir.sql
            Objetivo..........: Inserir um idioma no banco
            Autor.............: Thiago Oliveira
            Data..............: 02/12/2018
            Ex................:
                SELECT mundo.inserirIdioma(nome);
    */
    BEGIN
        IF EXISTS (SELECT id FROM mundo.idioma WHERE unaccent(nome) ILIKE unaccent(pNome)) THEN
            RETURN json_build_object(
                'message', 'Já existe um idioma com esse nome'
                'code', 1
            );
        END IF;
        
        INSERT INTO mundo.idioma(nome)
            VALUES(pNome);
        
        RETURN json_build_object(
            'message', 'Salvo com sucesso',
            'code',0
        );
    END;
$$ LANGUAGE plpgsql;