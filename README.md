Universidade-STORED-PROCEDURES-, é uma Atividade individual, feita para a matéria Banco de Dados da Facens.

Entidades:

Aluno
Professor
Curso
Atributos:

Aluno:

id (chave primária)
nome
data_nasc
curso_id (chave estrangeira referenciando a tabela de Cursos)
Professor:

id (chave primária)
nome
especialidade
Curso:

id (chave primária)
nome
professor_id (chave estrangeira referenciando a tabela de Professores)
Relacionamentos:

Aluno - Curso: Um aluno está matriculado em um curso. (Relacionamento muitos para um)
Curso - Professor: Um curso é ministrado por um professor. (Relacionamento um para um)

![image](https://github.com/FelipeLobo015/Universidade-STORED-PROCEDURES-/assets/77967679/e64966cf-611a-4111-923e-babe0db205f3)
