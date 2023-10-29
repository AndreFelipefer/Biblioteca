DELIMITER //

CREATE PROCEDURE RegistrarEmprestimo(
    IN p_idLivro INT,
    IN p_idCliente INT,
    IN p_dataEmprestimo DATE,
    IN p_dataDevolucao DATE
)
BEGIN
    DECLARE v_estoque INT;
    
    -- Verifique se o livro está disponível
    SELECT estoque INTO v_estoque
    FROM Livro
    WHERE idLivro = p_idLivro;
    
    IF v_estoque > 0 THEN
        -- O livro está disponível, registre o empréstimo
        INSERT INTO Emprestimos (dataEmprestimo, dataDevolucao, statusEmprestimo, Clientes_idClientes)
        VALUES (p_dataEmprestimo, p_dataDevolucao, 'pendente', p_idCliente);
        
        -- Atualize o estoque do livro
        UPDATE Livro
        SET estoque = estoque - 1
        WHERE idLivro = p_idLivro;
        
        SELECT 'Empréstimo registrado com sucesso.' AS Resultado;
    ELSE
        SELECT 'Livro não disponível para empréstimo.' AS Resultado;
    END IF;
    
END //

DELIMITER ;
