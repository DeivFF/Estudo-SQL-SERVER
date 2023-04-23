/*
FONTE: https://www.youtube.com/watch?v=Yvw60m0E9D8&list=PL7iAT8C5wumpQWB8AFW7CwK2nlzh8ZdP9&index=5


Chaves prim�rias (em ingl�s, Primary keys ou "PK"), sob o ponto de vista de um banco de dados relacional, referem-se aos conjuntos de um ou mais campos, cujos valores, considerando a combina��o de valores em caso de mais de uma chave prim�ria, nunca se repetem na mesma tabela e, desta forma, podem ser usadas como um �ndice de refer�ncia para criar relacionamentos com as demais tabela do banco de dados (da� vem o nome banco de dados relacional). Portanto, uma chave prim�ria nunca pode ter valor nulo, nem repeti��o.

Simplificando, quando a chave prim�ria � simples, ou seja, � formada por um �nico campo da tabela, esse campo n�o pode ter dois ou mais registros de mesmo valor e tamb�m n�o pode conter nenhum registro nulo. Se a chave prim�ria � composta, ou seja, formada por mais de um campo, os valores de cada campo podem se repetir, mas nunca a combina��o desses valores.


Uma chave estrangeira � um campo, que aponta para a chave prim�ria de outra tabela ou da mesma tabela. Ou seja, passa a existir uma rela��o entre duplas de duas tabelas ou de uma �nica tabela. A finalidade da chave estrangeira � garantir a integridade dos dados referenciais, pois apenas ser�o permitidos valores que supostamente v�o aparecer na base de dados.

Esse tipo de atributo n�o permite exclus�o, modifica��o ou inser��o de dados em tabelas que estejam dependentes umas das outras("foreign key"), o que requer modificadores especiais, como cascade, por exemplo. Isso tamb�m exige uma maior aten��o do administrador da base de dados, quanto � pr�pria manipula��o dos dados

*/


CREATE TABLE aluno (
id_aluno INT PRIMARY KEY,
nome VARCHAR(50) NOT NULL,
sobrenome VARCHAR(50) NOT NULL
)
-- Essa tabela � a tabela dimens�o, a tabela dimens�o sempre possuir� uma primary key ou seja, chave identificadora, a tabela dimens�o possui informa��es/caracter�sicas sobre determinado dado que ter� liga��o a tabela fato.

CREATE TABLE notas (
id_aluno INT NOT NULL,
nota DECIMAL(5,2),
FOREIGN KEY (id_aluno) REFERENCES aluno(id_aluno)
)
-- Essa tabela � a tabela fato, a tabela fato possui informa��es de eventos e sempre possuir� chave estangeira, � poss�vel que uma tabela dimens�o possua chave estangeira tamb�m, mas sempre a fato possuir� necessariamente, a sintaxe �: FOREIGN KEY (COLUNA_DA_TABELA_FATO_QUE_POSSUI_IDENTIFICADOR_NA_OUTRA_COLUNA) REFERENCES TABELA_QUE_POSSUI_A_PRIMARY_KEY(COLUNA_QUE_TEM_A_PRIMARY_KEY)
