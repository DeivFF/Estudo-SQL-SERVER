/*
FONTE: https://www.youtube.com/watch?v=Yvw60m0E9D8&list=PL7iAT8C5wumpQWB8AFW7CwK2nlzh8ZdP9&index=5


Chaves primárias (em inglês, Primary keys ou "PK"), sob o ponto de vista de um banco de dados relacional, referem-se aos conjuntos de um ou mais campos, cujos valores,
considerando a combinação de valores em caso de mais de uma chave primária, nunca se repetem na mesma tabela e, desta forma, podem ser usadas como um índice de referência
para criar relacionamentos com as demais tabela do banco de dados (daí vem o nome banco de dados relacional). Portanto, uma chave primária nunca pode ter valor nulo, 
nem repetição.

Simplificando, quando a chave primária é simples, ou seja, é formada por um único campo da tabela, esse campo não pode ter dois ou mais registros de mesmo valor e 
também não pode conter nenhum registro nulo. Se a chave primária é composta, ou seja, formada por mais de um campo, os valores de cada campo podem se repetir, mas 
nunca a combinação desses valores.


Uma chave estrangeira é um campo, que aponta para a chave primária de outra tabela ou da mesma tabela. Ou seja, passa a existir uma relação entre duplas de duas 
tabelas ou de uma única tabela. A finalidade da chave estrangeira é garantir a integridade dos dados referenciais, pois apenas serão permitidos valores que 
supostamente vão aparecer na base de dados.

Esse tipo de atributo não permite exclusão, modificação ou inserção de dados em tabelas que estejam dependentes umas das outras("foreign key"), o que requer 
modificadores especiais, como cascade, por exemplo. Isso também exige uma maior atenção do administrador da base de dados, quanto à própria manipulação dos dados

*/


CREATE TABLE aluno (
id_aluno INT PRIMARY KEY,
nome VARCHAR(50) NOT NULL,
sobrenome VARCHAR(50) NOT NULL
)
-- Essa tabela é a tabela dimensão, a tabela dimensão sempre possuirá uma primary key ou seja, chave identificadora, a tabela dimensão possui 
-- informações/caracterísicas sobre determinado dado que terá ligação a tabela fato.

CREATE TABLE notas (
id_aluno INT NOT NULL,
nota DECIMAL(5,2),
FOREIGN KEY (id_aluno) REFERENCES aluno(id_aluno)
)
-- Essa tabela é a tabela fato, a tabela fato possui informações de eventos e sempre possuirá chave estangeira, é possível que uma tabela dimensão possua chave
-- estangeira também, mas sempre a fato possuirá necessariamente, a sintaxe é: FOREIGN KEY (COLUNA_DA_TABELA_FATO_QUE_POSSUI_IDENTIFICADOR_NA_OUTRA_COLUNA) REFERENCES
-- TABELA_QUE_POSSUI_A_PRIMARY_KEY(COLUNA_QUE_TEM_A_PRIMARY_KEY)
