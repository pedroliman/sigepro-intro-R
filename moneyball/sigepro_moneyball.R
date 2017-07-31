
#' Exemplo - MoneyBall
#' ========================================================
#' Este exemplo usa dados relacionados ao filme "Moneyball" para apresentar a técnica de regressão linear com o R.
#' Este exercício e a ideia de usar o exemplo do Moneyball é baseda em uma aula do MIT, da plataforma Edx: https://courses.edx.org/courses/course-v1:MITx+15.071x_3+1T2016/
#' 

library(knitr)

#' Lendo Dados em CSV com read.csv()
#' ========================================================
#' Normalmente lemos dados no formato .csv no R para realizar as análises. É possível também ler dados em outros formatos.

# Definindo o Working Directory (pasta base na qual estaremos trabalhando).
# Esta função mostra as variáveis que temos, seus tipos e seus 
setwd("D:/DADOS/dev/sigepro-moneyball/moneyball")

# Lendo Dados em CSV
baseball = read.csv("baseball.csv")

#' Conhecendo os Dados com str()
#' ========================================================
#' Antes de rodar qualquer análise precisamos conhecer a estrutura dos dados.
# Podemos fazer isso usando a função str() (que mostra a estrutura)
str(baseball)

##' Definições de Variáveis
#' ========================================================
#' Antes de rodar qualquer análise precisamos conhecer a estrutura dos dados.
## TODO

#' O retnorno da função nos diz que esta variável "baseball" é um DataFrame. Um Dataframe é um tipo de variável no R que pode armazenar diversos tipos de dados (Números, texto, etc), que podemos usar no R.

##' Resumindo com o summary()
#' ========================================================
#' Também podemos ter uma ideia dos dados usando o summary. Ele nos retorna médias, quartis, valores mínimos e máximos.
# 
summary(baseball)


#' Acessando variáveis específicas de um DataFrame
#' ========================================================
#' Podemos acessar variáveis específicas de um Data Frame usando algumas notações possíveis

#' Selecionando a coluna Ano
baseball$Year

#' De que anos estamos falando?
hist(baseball$Year)

#' Acessando variáveis específicas de um DataFrame
#' ========================================================
#' Podemos acessar variáveis específicas de um Data Frame usando algumas notações possíveis


# Subset to only include moneyball years
moneyball = subset(baseball, Year < 2002)
str(moneyball)

# Compute Run Difference
moneyball$RD = moneyball$RS - moneyball$RA
str(moneyball)

# Scatterplot to check for linear relationship
plot(moneyball$RD, moneyball$W)

# Regression model to predict wins
WinsReg = lm(W ~ RD, data=moneyball)
summary(WinsReg)


# VIDEO 3

str(moneyball)

# Regression model to predict runs scored
RunsReg = lm(RS ~ OBP + SLG + BA, data=moneyball)
summary(RunsReg)

RunsReg = lm(RS ~ OBP + SLG, data=moneyball)
summary(RunsReg)
