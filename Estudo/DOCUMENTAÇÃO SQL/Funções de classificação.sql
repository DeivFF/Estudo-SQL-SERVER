-- FUNÇÕES DE CLASSIFICAÇÃO


-- ROW NUMBER
SELECT Nome,AVG(produtividade),Equipe,ROW_NUMBER() OVER(partition by equipe ORDER BY AVG(produtividade) desc) as RANK FROM indicadores as I
INNER JOIN colaboradores as C ON I.id_colaborador = C.ID
GROUP BY c.nome,equipe

/* Fórmula responsável por calcular o rank de cada colaborar em relação a média total e particionado por equipe, ou seja, quando a equipe mudar, o rank reinicia*/

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

Observações:

As três funções agem de modo semelhante. Vamos às diferenças:

A função RANK é responsável por ranquear determinada coluna. Nos casos em que há empate, ela repete a mesma posição e, logo após isso, continua o rank pulando a quantidade de repetições que houve. Por exemplo: supondo que haja um empate na posição 3 e essa posição se repita 4 vezes, o próximo rank não será 4, mas sim 7.

A função DENSE_RANK age de modo semelhante à função RANK, a diferença é que ela não pula posições, mesmo que determinada posição se repita.

A função ROW_NUMBER ranqueia a posição sem repetir nenhum valor, mesmo que haja empate. Além disso, não pula nenhum valor e todas as posições são únicas.

A função NTILE é responsável por criar determinada quantidade de grupos, a quantidade a ser formada é passada como parâmetro na própria função., 

*/

