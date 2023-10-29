CREATE VIEW EmpréstimosAtuais AS
SELECT
    E.idEmprestimos,
    E.dataEmprestimo,
    E.dataDevolucao,
    E.statusEmprestimo,
    C.idClientes,
    C.nome AS nomeCliente,
    C.cpf,
    C.dataNascimento AS dataNascimentoCliente,
    C.endereco AS enderecoCliente,
    L.idLivro,
    L.titulo AS tituloLivro,
    L.ISBN AS ISBNLivro,
    L.anoPublicacao AS anoPublicacaoLivro,
    A.idAutores AS idAutorLivro,
    A.nomeAutores AS nomeAutorLivro,
    A.dataNascimento AS dataNascimentoAutorLivro,
    A.nacionalidade AS nacionalidadeAutorLivro,
    E.multas
FROM
    Emprestimos AS E
INNER JOIN
    Clientes AS C ON E.Clientes_idClientes = C.idClientes
INNER JOIN
    Livro AS L ON E.Emprestimos_idEmprestimos = L.idLivro
INNER JOIN
    Autores AS A ON L.Autores_idAutores = A.idAutores
WHERE
    E.statusEmprestimo = 'pendente';
