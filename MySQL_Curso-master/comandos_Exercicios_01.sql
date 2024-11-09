/*
Exercícios do curso de MySQL / Agosto de 2019.
*/

use cadastro;

# 1)Uma lista com o nome de todas as gafanhotas.
SELECT 
    nome
FROM
    gafanhotos
WHERE
    sexo = 'F';

#===================================================================================================

# 2)Uma lista com os dados de todos que nasceram entre 01/01/2000 e 31/12/2015.
SELECT 
    *
FROM
    gafanhotos
WHERE
    nascimento BETWEEN '2000-01-01' AND '2015-12-31';

#===================================================================================================

# 3)Uma lista com o nome de todos os homens que são programadores.
SELECT 
    nome, profissao
FROM
    gafanhotos
WHERE
    sexo = 'M' AND profissao = 'programador';

#===================================================================================================

# 4)Uma lista com os dados de todas as mulheres que nasceram no Brasil e o nome começa com "J".
SELECT 
    *
FROM
    gafanhotos
WHERE
    sexo = 'F' AND nacionalidade = 'Brasil'
        AND nome LIKE 'J%';

#===================================================================================================

# 5)Uma lista com o nome e a nacionalidade de todos os homens que tem "Silva" no nome,
# não nasceram no Brasil e pesam menos de 100kg.
SELECT 
    nome, nacionalidade, peso
FROM
    gafanhotos
WHERE
    sexo = 'M' AND nome LIKE '%Silva%'
        AND nacionalidade != 'Brasil'
        AND peso < '100';

#===================================================================================================

# 6)Qual é a maior altura de homens que moram no Brasil?
SELECT 
    MAX(altura)
FROM
    gafanhotos
WHERE
    nacionalidade = 'Brasil' AND sexo = 'M';
    
#===================================================================================================

# 7)Qual é a média de peso dos gafanhotos cadastrados?
SELECT 
    AVG(peso)
FROM
    gafanhotos;

#===================================================================================================

# 8)Qual é o menor peso entre mulheres que nasceram fora do Brasil e entre 01/01/1990 e 31/12/2000?
SELECT 
    MIN(peso)
FROM
    gafanhotos
WHERE
    sexo = 'F' AND nacionalidade != 'Brasil'
        AND nascimento BETWEEN '1990-01-01' AND '2000-12-31';
        
#===================================================================================================

# 9)Quantas mulheres têm mais de 1,90m de altura?

SELECT 
    COUNT(*)
FROM
    gafanhotos
WHERE
    sexo = 'F' AND altura > 1.90;
    
#===================================================================================================
#                                    Segunda Parte
#===================================================================================================    

# 1) Uma lista com as profissões dos gafanhotos e seus respectivos quantitativos.
SELECT 
    profissao, COUNT(*)
FROM
    gafanhotos
GROUP BY profissao;

#===================================================================================================    

# 2) Quantos gafanhotos homens e quantas mulheres nasceram após 01/01/2005 ?
select sexo, count(*) from gafanhotos where nascimento > '2005-01-01' group by sexo;

#===================================================================================================    

# 3) Uma lista com os gafanhotos que nasceram fora do Brasil, mostrando o país de
# origem e o total de pessoas nascidas lá. Só nos interessam os países que tiveram
# mais de 3 gafanhotos com essa nacionalidade.
SELECT 
    nacionalidade, COUNT(*)
FROM
    gafanhotos
WHERE
    nacionalidade != 'Brasil'
GROUP BY nacionalidade
HAVING COUNT(nacionalidade) > 3;

#===================================================================================================    

# 4)Uma lista agrupada pela altura dos gafanhotos, mostrando quantas pessoas pesam
# mais de 100Kg e que estão acima da média de altura de todos os cadastrados.
SELECT 
    altura, COUNT(*)
FROM
    gafanhotos
WHERE
    peso > 100
GROUP BY altura having altura > (select avg(altura) from gafanhotos);

#===================================================================================================    






