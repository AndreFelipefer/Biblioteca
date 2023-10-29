DELIMITER //

CREATE PROCEDURE CalcularMultas()
BEGIN
    DECLARE v_multa DECIMAL(10, 2);
    DECLARE v_idEmprestimo INT;
    DECLARE v_dataDevolucao DATE;
    DECLARE v_dataAtual DATE;
    
    -- Obtém a data atual
    SET v_dataAtual = CURDATE();
    
    -- Loop para calcular multas em empréstimos atrasados
    DECLARE cur CURSOR FOR
        SELECT idEmprestimos, dataDevolucao
        FROM Emprestimos
        WHERE statusEmprestimo = 'pendente' AND dataDevolucao < v_dataAtual;
    
    OPEN cur;
    
    multa_loop: LOOP
        FETCH cur INTO v_idEmprestimo, v_dataDevolucao;
        
        IF v_idEmprestimo IS NULL THEN
            LEAVE multa_loop;
        END IF;
        
        -- Calcula a multa com base na diferença de dias
        SET v_multa = DATEDIFF(v_dataAtual, v_dataDevolucao) * 5; -- 5 unidades de moeda por dia de atraso
        
        -- Atualiza o status do empréstimo e a multa
        UPDATE Emprestimos
        SET statusEmprestimo = 'atrasado', multa = v_multa
        WHERE idEmprestimos = v_idEmprestimo;
        
    END LOOP;
    
    CLOSE cur;
    
    SELECT 'Multas calculadas com sucesso.' AS Resultado;
    
END //

DELIMITER ;
