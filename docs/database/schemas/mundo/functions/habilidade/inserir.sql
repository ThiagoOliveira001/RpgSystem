CREATE OR REPLACE FUNCTION mundo.inserirHabilidade(
    pNome mundo.habilidade.id%TYPE
) RETURNS void
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
        INSERT INTO mundo.habilidade(nome)
            VALUES(pNome);
    END;
$$ LANGUAGE plpgsql;