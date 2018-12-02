CREATE OR REPLACE FUNCTION mundo.selecionarIdiomas(
    pNome mundo.idioma.nome%TYPE,
    pQtde integer,
    pPage integer
) RETURNS json
AS $$ 
    /*
        Documentação
            Arquivo fonte.....: selecionar.sql
            Objetivo..........: Selecionar idiomas do banco
            Autor.............: Thiago Oliveira
            Data..............: 02/12/2018
            Ex................:
                SELECT * FROM mundo.selecionarIdiomas(nome,qtde,page);
    */
    BEGIN
        RETURN (
            SELECT row_to_json(t)
            FROM ( 
                SELECT array_to_json(array_agg(r)) AS idiomas, (
		  SELECT COUNT(id)
		  FROM mundo.idioma
		  WHERE (pNome IS NULL OR unaccent(nome) ILIKE '%' || unaccent(pNome) || '%' )
                ) AS total
                FROM (
                    SELECT
                        nome,
                        id
                    FROM mundo.idioma
                    WHERE (pNome IS NULL OR unaccent(nome) ILIKE '%' || unaccent(pNome) || '%' )
                    LIMIT pQtde
                    OFFSET (pPage - 1) * pQtde 
                ) as r 
            ) as t
        );
    END;
$$ LANGUAGE plpgsql;