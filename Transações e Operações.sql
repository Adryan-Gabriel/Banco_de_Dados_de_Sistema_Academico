-- ETAPA 4 - TRANSAÇÕES
-- Aluno: Adryan Gabriel Borges Rocha

-- CENÁRIO A: FLUXO PADRÃO DO SISTEMA (SUCESSO)
-- A ideia aqui é simular o fluxo normal: o aluno é matriculado na turma e o registro do histórico dele já é criado na hora.
-- Como nenhum comando dá erro, as alterações são salvas definitivamente.

-- Abre a transação para garantir a atomicidade da operação
BEGIN;

-- Vincula o aluno 100 na turma 3
INSERT INTO Aluno_Turma (ID_Aluno, ID_Turma, FREQUENCIA) 
VALUES (100, 3, 100.00);

-- Cria a linha de histórico dele para essa mesma turma com nota inicial zero
INSERT INTO Historico (ID_Historico, ID_Aluno, ID_Turma, NOTA, FREQUENCIA) 
VALUES (999, 100, 3, 0.00, 100.00);

-- Como os dados estão corretos e as constraints passaram, grava tudo como definitivo
COMMIT;

-- CENÁRIO B: VERIFICANDO RESTRIÇÃO DE INTEGRIDADE (FALHA)
-- Aqui o sistema tenta lançar um histórico apontando para a turma 88, que não existe no sistema.
-- O banco deve bloquear a operação.

-- Abre uma nova transação
BEGIN;

-- Tenta inserir um histórico associado a uma turma inexistente (ID 88)
INSERT INTO Historico (ID_Historico, ID_Aluno, ID_Turma, NOTA, FREQUENCIA) 
VALUES (46, 600, 88, 0.00, 100.00);

-- Como a operação falhou e quebrou as regras, desfazemos tudo o que foi tentado
ROLLBACK;

-- CENÁRIO C: Teste utilizando savepoint

-- Inicia uma transação
BEGIN;

-- Cria um ponto de restauração dentro da transação
SAVEPOINT ANTES_DO_INSERT;

-- Insere um novo usuário
INSERT INTO Usuario (ID_Usuario,NOME,CPF,Telefone,E_MAIL,SENHA)
VALUES (1234,'Bruno Messi','122.456.789-00','(62) 98888-1111','Ronaldo7@gmail.com','123');

-- Desfaz tudo o que foi feito após o savepoi
ROLLBACK TO SAVEPOINT ANTES_DO_INSERT;

-- Finaliza a transação
COMMIT;
