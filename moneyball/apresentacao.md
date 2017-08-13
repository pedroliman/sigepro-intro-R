---
output: 
  html_document: 
    theme: spacelab
---
Introdu��o a Data Analytics com o R
========================================================
Aprendendo com o Homem que Mudou o Jogo.

author: Pedro Nascimento de Lima e Dieter Brackman Goldmeyer
date: 18/08/2017
autosize: true

O que Veremos neste Mini-Curso?
========================================================

- O que � Data Analytics?
- Principais T�cnicas
- Exemplo Moneyball.
- ***Como continuar aprendendo.***

O que � Data Analytics?
========================================================
- Novo nome mais bonito para "Estat�stica";
- Business Analytics;
- Outros termos (Big Data, Machine Learning, Data Science podem ser um pouco imprecisos);

Porque usar o R ?
========================================================
- Open Source e Gratuito;
- Mais de 10 k bibliotecas gratuitas;
- Suporta muitos tipos de An�lises;
- Conhecimento "cumulativo" e transfer�vel a outros contextos.

Outras alternativas se voc� n�o quiser programar.
========================================================
- Excel(?);
- Alteryx;
- Microsoft Azure;
- Tableu para An�lises visuais mais simples;


Que tipo de pessoa usa o R?
========================================================
- R Developer: "Um desenvolvedor R usa suas habilidades de programama��o para manipular dados e construir ferramentas para para an�lise de Dados."
- Data Scientist: "Um cientista de dados combina t�cnicas estat�sticas e de machine learning com programa��o em R para analisar e interpretar dados complexos".
- Data Analyst: Um Data Analyst traduz n�meros em portugu�s claro. Um analista de dados interpreta dados das empresas e o usa para tomar melhores decis�es.
- Analista Quantitativo: Na �rea financeira, uma analista quantitativo garante que portfolios de investimento est�o balenceados e encontra novas oportunidades de trading, e avalia pre�os de ativos usando modelos matem�ticos.
Fonte: http://datacamp.com





```r
summary(cars)
```

```
     speed           dist       
 Min.   : 4.0   Min.   :  2.00  
 1st Qu.:12.0   1st Qu.: 26.00  
 Median :15.0   Median : 36.00  
 Mean   :15.4   Mean   : 42.98  
 3rd Qu.:19.0   3rd Qu.: 56.00  
 Max.   :25.0   Max.   :120.00  
```

Lendo Dados em CSV com read.csv()
========================================================
Normalmente lemos dados no formato .csv no R para realizar as an�lises. � poss�vel tamb�m ler dados em outros formatos.


```r
# Definindo o Working Directory (pasta base na qual estaremos trabalhando).
# Esta fun��o mostra as vari�veis que temos, seus tipos e seus 
setwd("D:/DADOS/dev/sigepro-moneyball/moneyball")
```

