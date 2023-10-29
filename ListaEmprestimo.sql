DELIMITER //

CREATE PROCEDURE ListaLivrosEmprestadosPorCliente(
    IN p_idCliente INT
)
BEGIN
    SELECT
        L.titulo AS NomeLivro,
        L.ISBN,
        E.dataEmprestimo AS DataEmprestimo,
        E.dataDevolucao AS DataDevolucao,
        E.statusEmprestimo
    FROM
        Livro AS L
    INNER JOIN
        Emprestimos AS E ON L.idLivro = E.Emprestimos_idEmprestimos
    WHERE
        E.Clientes_idClientes = p_idCliente;
END //

DELIMITER ;
