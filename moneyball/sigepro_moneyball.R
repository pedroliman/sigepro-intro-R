#' Exemplo - MoneyBall
#' ========================================================
#' Este exemplo usa dados relacionados ao filme "Moneyball" para apresentar a técnica de regressão linear com o R.
#' Este exercício e a ideia de usar o exemplo do Moneyball é baseda em uma aula do MIT, da plataforma Edx: https://courses.edx.org/courses/course-v1:MITx+15.071x_3+1T2016/
#' Adaptado e traduzido por Pedro Nascimento de Lima e Dieter B. Goldmeyer


# Se ainda não instalou os pacotes, instalar:
install.packages("ggpubr")

# Carregar os Pacotes
library(ggpubr)


# Definindo o Working Directory (pasta base na qual estaremos trabalhando).
setwd("D:/dev/sigepro-intro-R/moneyball/")
# Lendo Dados em CSV
baseball <- read.csv("baseball.csv")

# Conhecendo os Dados..
# Podemos fazer isso usando a função str() (que mostra a estrutura)
str(baseball)

# Resumindo
summary(baseball)

# Acessando uma Variável
baseball$Year

# Ou também..
baseball["Year"]

# Trazendo a Lista de colunas para um vetor...
colunas = colnames(baseball)
colunas

# Considerando apenas anos exibidos pelo moneyball
moneyball = subset(baseball, Year < 2002)
str(moneyball)

# Calculando a Run Difference
moneyball$RD = moneyball$RS - moneyball$RA
str(moneyball)

# Há uma relação Linear?
plot(moneyball$RD, moneyball$W, main = "Vitórias vs Runs Diff.", xlab = "Run. Diff.", ylab = "Vitórias")

# Alguns Testes de Correlação
cor(x = moneyball$RD, y = moneyball$W, method=c("pearson", "kendall", "spearman"))

cor.test(x = moneyball$RD, y = moneyball$W, method=c("pearson", "kendall", "spearman"))

# Mais um gráfico
ggpubr::ggscatter(moneyball, x = "RD", y = "W", 
                  add = "reg.line", conf.int = TRUE, 
                  cor.coef = TRUE, cor.method = "pearson",
                  xlab = "Run Diff.", ylab = "Vitórias")

# Obtendo um Modelo Linear
modelo_vitorias = lm(W ~ RD, data=moneyball)

# Analisando o Modelo
summary(modelo_vitorias)

# Calculando o Run Difference Mínimo
RD_min = (95 - 80.8814)/0.1058
RD_min

# Observando outras variáveis
str(moneyball)

# Predizendo o Número de Runs
modeloruns = lm(formula = RS ~ OBP + SLG + BA, data=moneyball)
summary(modeloruns)

# Predizendo Sem Batting Average
modeloruns_sBA = lm(formula = RS ~ OBP + SLG, data=moneyball)
summary(modeloruns_sBA)

# Predizendo Runs Permitidas
modelorunsallowed = lm(formula = RA ~ OOBP + OSLG, data=moneyball)
summary(modelorunsallowed)

# Quanto é a Estimativa de RUns?
Runs = -804.3 + 2737.77 * 0.339 + 1584.91 *  0.430
Runs

# Calculando Runs Permitidas
RunsAllowed = -837 + 2913.6 * 0.307 + 1514.29 * 0.373
RunsAllowed

# Esse time vai chegar às playoffs?
Vitorias = 80.88 + 0.1057 * (Runs - RunsAllowed)
if (Vitorias >= 95) {
  paste("Esse time deve chegar nas Playoffs com ", Vitorias, " vitórias.")
} else {
  paste("Compre outros Jogadores, este time não chega nas playoffs com apenas ", Vitorias, " vitórias!")
}