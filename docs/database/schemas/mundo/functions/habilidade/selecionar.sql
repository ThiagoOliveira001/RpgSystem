CREATE OR REPLACE FUNCTION mundo.selecionarHabilidades(
    pNome mundo.habilidade.nome%TYPE
) RETURNS TABLE (
    "id" mundo.habilidade.id%TYPE,
    "nome" mundo.habilidade.nome%TYPE 
) 
AS $$
    /*
        Documentacao
            Arquivo fonte.....: selecionar.sql
            Objetivo..........: Selecionar as habilidades do banco
            Autor.............: Thiago Oliveira
            Ex................:
                SELECT * FROM mundo.selecionarHabilidades(nome);
    */
    BEGIN
        RETURN QUERY
            SELECT 
                h.id,
                h.nome
            FROM mundo.habilidade AS h
            WHERE (pNome IS NULL OR h.nome = pNome);
    END;
$$ LANGUAGE plpgsql;