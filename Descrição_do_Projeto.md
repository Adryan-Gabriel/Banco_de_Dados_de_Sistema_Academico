Aluno: Adryan Gabriel Borges Rocha 

Descrição do Projeto 

O que é o sistema? 
Este projeto consiste no desenvolvimento de um banco de dados relacional para  um Sistema de Gestão Acadêmica, planejado especificamente para centralizar as  informações de uma instituição de ensino e eliminar a redundância de dados. O  grande diferencial da nossa estrutura é o uso do conceito de herança para unificar o  controle de acessos e dados pessoais. 

Como ele funciona na prática com base na nossa modelagem?  
Criamos a tabela principal Usuario, que centraliza as informações de login e  identificação de todos (nome, CPF, telefone, e-mail e senha). A partir dela, o banco  se ramifica para perfis específicos: a tabela Aluno e a tabela Professor (que guarda  os dados de formação e salário). 
O coração acadêmico do sistema funciona interligando Curso, Grade e Disciplina.  Para colocar o sistema em funcionamento prático no dia a dia, as matérias são  ofertadas em Turma (ligando uma disciplina ao seu professor). O ciclo do aluno é  controlado em dois momentos cruciais: a tabela Matricula, que vincula o aluno ao  seu curso controlando o ano, o semestre, a situação do vínculo, a carga horária e a  frequência global; e a tabela intermediária Aluno_Turma, que faz o controle de  chamadas em tempo real durante o semestre. Por fim, ao encerrar o período, todos  os dados de desempenho são consolidados de forma definitiva na tabela Historico  (armazenando a nota e a frequência final). 

Documento de Requisitos Funcionais 

Módulo de Usuários e Perfis 
RF01 – Cadastro de Usuários: Registro de CPF, E-mail e Senha (obrigatórios). Nome e Telefone são opcionais (NULL) para permitir testes práticos de comandos JOIN. 
RF02 – Vínculo de Alunos: O sistema deve permitir que um usuário cadastrado seja  identificado como um Aluno através do seu ID, sem a necessidade de duplicar seus  dados pessoais. 
RF03 – Vínculo e Remuneração de Docentes (Professor): O sistema deve permitir  que um usuário seja registrado como Professor, adicionando de forma exclusiva a  sua formação acadêmica e o seu salário base (DECIMAL). 

Módulo de Estrutura de Cursos e Matrizes
RF04 – Cadastro de Cursos: O sistema deve registrar os cursos da instituição  guardando a modalidade e a duração prevista. 
RF05 – Definição de Matriz Curricular (Grade): O sistema deve permitir associar  uma grade a cada curso para rastrear e gerenciar a carga horária total exigida. 
RF06 – Cadastro de Componentes Curriculares (Disciplina): O sistema deve permitir  cadastrar as matérias dentro de uma grade, especificando o nome da disciplina, os  créditos correspondentes e a respectiva carga horária. 

Módulo de Turmas e Chamadas 
RF07 – Oferta de Turmas: O sistema deve permitir abrir turmas associando  diretamente uma disciplina ao professor que vai ministrá-la. 
RF08 – Enturmação e Frequência Parcial (Aluno_Turma): O sistema deve permitir  inscrever os alunos nas turmas disponíveis para o semestre e registrar a frequência  parcial atualizada de cada um dentro daquela disciplina. 

Módulo de Matrícula e Histórico 
RF09 – Controle de Matrícula: Gerenciar o vínculo do aluno com o curso, registrando o Ano/Semestre de ingresso e a situação atual (ex: Ativo, Trancado).  
RF10 – Consolidação de Notas (Histórico): Ao encerrar o período letivo, o sistema  deve registrar de forma permanente no histórico do aluno a nota final obtida na  matéria (no formato DECIMAL(4,2)) e a sua frequência final fechada  (DECIMAL(5,2)).
