-- Aluno: Adryan Gabriel Borges Rocha

--Consultas

-- 1.Mostra o ID do aluno e o Nome dele cruzando as tabelas.
SELECT Aluno.ID_Aluno, Usuario.NOME
FROM Aluno
INNER JOIN Usuario ON Aluno.ID_Usuario = Usuario.ID_Usuario;

-- 2.Exibe os alunos que estão sem o Nome cadastrado. 
SELECT Aluno.ID_Aluno, Usuario.NOME
FROM Aluno
LEFT JOIN Usuario ON Aluno.ID_Usuario = Usuario.ID_Usuario
WHERE Usuario.NOME IS NULL;

-- 3.Identifica os alunos que estão sem o Telefone no sistema.
SELECT Aluno.ID_Aluno, Usuario.NOME, Usuario.Telefone
FROM Usuario
RIGHT JOIN Aluno ON Aluno.ID_Usuario = Usuario.ID_Usuario
WHERE Usuario.Telefone IS NULL;

-- 4. Cruza a tabela principal de Matricula com Aluno, Usuario e Curso
SELECT 
    Aluno.ID_Aluno,
    Usuario.NOME,
    Curso.Nome_Curso,
    Matricula.SITUACAO
FROM Matricula
JOIN Aluno ON Matricula.ID_Aluno = Aluno.ID_Aluno
JOIN Usuario ON Aluno.ID_Usuario = Usuario.ID_Usuario
JOIN Curso ON Matricula.ID_Curso = Curso.ID_Curso
ORDER BY Curso.Nome_Curso, Usuario.NOME;
 
-- 5.Cruza dados das tabelas para exibir a turma, disciplina, professor e a frequencia.
SELECT 
    Turma.ID_Turma,
    Disciplina.Nome_Disciplina,
    U_Prof.NOME,
    U_Alu.NOME,
    Aluno_Turma.FREQUENCIA
FROM Aluno_Turma
JOIN Aluno ON Aluno_Turma.ID_Aluno = Aluno.ID_Aluno
JOIN Usuario U_Alu ON Aluno.ID_Usuario = U_Alu.ID_Usuario
JOIN Turma ON Aluno_Turma.ID_Turma = Turma.ID_Turma
JOIN Disciplina ON Turma.ID_Disciplina = Disciplina.ID_Disciplina
JOIN Professor ON Turma.ID_Professor = Professor.ID_Professor
JOIN Usuario U_Prof ON Professor.ID_Usuario = U_Prof.ID_Usuario
ORDER BY Turma.ID_Turma, U_Alu.NOME;

-- 6.Filtra registros no historico e apresenta a nota igual ou superior 7.00.
SELECT 
    Aluno.ID_Aluno,
    Usuario.NOME,
    Disciplina.Nome_Disciplina,
    Historico.NOTA
FROM Historico
JOIN Aluno ON Historico.ID_Aluno = Aluno.ID_Aluno
JOIN Usuario ON Aluno.ID_Usuario = Usuario.ID_Usuario
JOIN Turma ON Historico.ID_Turma = Turma.ID_Turma
JOIN Disciplina ON Turma.ID_Disciplina = Disciplina.ID_Disciplina
WHERE Historico.NOTA >= 7.00
ORDER BY Historico.NOTA DESC;
 
-- 7.Agrupa os dados por materia e calcula a quantidade de alunos, a nota media, a maior nota e a menor nota.  
SELECT	
	Disciplina.Nome_Disciplina,
    COUNT(Historico.ID_Aluno),
    ROUND(AVG(Historico.NOTA), 2),
    MAX(Historico.NOTA),
    MIN(Historico.NOTA)
FROM Historico
JOIN Turma ON Historico.ID_Turma = Turma.ID_Turma
JOIN Disciplina ON Turma.ID_Disciplina = Disciplina.ID_Disciplina
GROUP BY Disciplina.Nome_Disciplina
ORDER BY ROUND(AVG(Historico.NOTA), 2) DESC;

-- 8.Procura na tabela de usuarios que estão com campos nulos Nome ou Telefone usei para achar oande estariam os dados incompletos.
SELECT 
    ID_Usuario, 
    CPF, 
    E_MAIL,
    NOME,
    Telefone
FROM Usuario
WHERE NOME IS NULL OR Telefone IS NULL;

-- 9.Lista so as materias onde a media dos alunos ficou abaixo de 7.
SELECT 
    D.Nome_Disciplina AS Disciplina,
    COUNT(H.ID_Aluno) AS Total_Alunos,
    ROUND(AVG(H.NOTA), 2) AS Media_Geral_Turma
FROM Historico H
JOIN Turma T ON H.ID_Turma = T.ID_Turma
JOIN Disciplina D ON T.ID_Disciplina = D.ID_Disciplina
GROUP BY D.Nome_Disciplina
HAVING AVG(H.NOTA) < 7.00;
 
-- 10.Calcular a media global de todas as notas e filtra os alunos que ficaram acima desse valor.
SELECT 
    Aluno.ID_Aluno,
    Usuario.NOME,
    Disciplina.Nome_Disciplina,
    Historico.NOTA
FROM Historico
JOIN Aluno ON Historico.ID_Aluno = Aluno.ID_Aluno
JOIN Usuario ON Aluno.ID_Usuario = Usuario.ID_Usuario
JOIN Turma ON Historico.ID_Turma = Turma.ID_Turma
JOIN Disciplina ON Turma.ID_Disciplina = Disciplina.ID_Disciplina
WHERE Historico.NOTA > (SELECT AVG(NOTA) FROM Historico)
ORDER BY Historico.NOTA DESC;
