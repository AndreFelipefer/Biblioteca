CREATE VIEW LivrosDisponiveis AS
SELECT
    L.idLivro,
    L.titulo,
    L.ISBN,
    L.anoPublicacao,
    L.Autores_idAutores,
    L.Emprestimos_idEmprestimos,
    L.Emprestimos_Clientes_idClientes,
    L.Editoras_idEditoras,
    L.estoque
FROM
    Livro AS L
LEFT JOIN
    Emprestimos AS E ON L.idLivro = E.Emprestimos_idEmprestimos
WHERE
    E.idEmprestimos IS NULL OR E.statusEmprestimo = 'devolvido';
