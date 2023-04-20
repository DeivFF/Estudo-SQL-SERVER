-- FUN��ES DE CLASSIFICA��O


-- ROW NUMBER
SELECT Nome,AVG(produtividade),Equipe,ROW_NUMBER() OVER(partition by equipe ORDER BY AVG(produtividade) desc) as RANK FROM indicadores as I
INNER JOIN colaboradores as C ON I.id_colaborador = C.ID
GROUP BY c.nome,equipe

/* F�rmula respons�vel por calcular o rank de cada colaborar em rela��o a m�dia total e particionado por equipe, ou seja, quando a equipe mudar, o rank reinicia*/

-- DENSE RANK
SELECT Nome,AVG(produtividade),Equipe,DENSE_RANK() OVER(partition by equipe ORDER BY AVG(produtividade) desc) as RANK FROM indicadores as I
INNER JOIN colaboradores as C ON I.id_colaborador = C.ID
GROUP BY c.nome,equipe


-- RANK
SELECT Nome,AVG(produtividade),Equipe, RANK() OVER(partition by equipe ORDER BY AVG(produtividade) desc) as RANK FROM indicadores as I
INNER JOIN colaboradores as C ON I.id_colaborador = C.ID
GROUP BY c.nome,equipe

-- NTILE

SELECT Nome,AVG(produtividade),Equipe, NTILE(4) OVER(partition by equipe ORDER BY AVG(produtividade) desc) as RANK FROM indicadores as I
INNER JOIN colaboradores as C ON I.id_colaborador = C.ID
GROUP BY c.nome,equipe


/* 

Obser��es:

As tr�s fun��es agem de modo semelhantes, vamos as diferen�as:

A fun��o RANK � respons�vel por rankear determinada coluna, nos casos em que da empate ela repete a mesma posi��o e logo ap�s
isto continua o rank pulando a quantidade de repeti��o que houve. Por exemplo: Supondo que haja um empate na posi��o 3 e essa posi��o se repita 4 vezes, o pr�ximo rank n�o ser� 4 mas sim 7.

A fun��o DENSE_RANK age de modo semelhante a fun��o RANK a diferen�a � que ela n�o pula posi��es mesmo que determinada posi��o se repita.

A fun��o ROW_NUMBER rankeia a posi��o sem repetir nenhum valor mesmo que haja empate, tamb�m n�o pula nenhum valor, todas as posi��es s�o �nicas.

A fun��o NTILE � respons�vel por criar determinada quantidade de grupos, a quantidade a ser formada � passada como par�metro na pr�pria fun��o, 

*/

