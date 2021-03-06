#' Exemplo - MoneyBall
#' ========================================================
#' Este exemplo usa dados relacionados ao filme "Moneyball" para apresentar a t�cnica de regress�o linear com o R.
#' Este exerc�cio e a ideia de usar o exemplo do Moneyball � baseda em uma aula do MIT, da plataforma Edx: https://courses.edx.org/courses/course-v1:MITx+15.071x_3+1T2016/
#' Adaptado e traduzido por Pedro Nascimento de Lima e Dieter B. Goldmeyer


# Se ainda n�o instalou os pacotes, instalar:
install.packages("ggpubr")

# Carregar os Pacotes
library(ggpubr)


# Definindo o Working Directory (pasta base na qual estaremos trabalhando).
setwd("D:/dev/sigepro-intro-R/moneyball/")
# Lendo Dados em CSV
baseball <- read.csv("baseball.csv")

# Conhecendo os Dados..
# Podemos fazer isso usando a fun��o str() (que mostra a estrutura)
str(baseball)

# Resumindo
summary(baseball)

# Acessando uma Vari�vel
baseball$Year

# Ou tamb�m..
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

# H� uma rela��o Linear?
plot(moneyball$RD, moneyball$W, main = "Vit�rias vs Runs Diff.", xlab = "Run. Diff.", ylab = "Vit�rias")

# Alguns Testes de Correla��o
cor(x = moneyball$RD, y = moneyball$W, method=c("pearson", "kendall", "spearman"))

cor.test(x = moneyball$RD, y = moneyball$W, method=c("pearson", "kendall", "spearman"))

# Mais um gr�fico
ggpubr::ggscatter(moneyball, x = "RD", y = "W", 
                  add = "reg.line", conf.int = TRUE, 
                  cor.coef = TRUE, cor.method = "pearson",
                  xlab = "Run Diff.", ylab = "Vit�rias")

# Obtendo um Modelo Linear
modelo_vitorias = lm(W ~ RD, data=moneyball)

# Analisando o Modelo
summary(modelo_vitorias)

# Calculando o Run Difference M�nimo
RD_min = (95 - 80.8814)/0.1058
RD_min

# Observando outras vari�veis
str(moneyball)

# Predizendo o N�mero de Runs
modeloruns = lm(formula = RS ~ OBP + SLG + BA, data=moneyball)
summary(modeloruns)

# Predizendo Sem Batting Average
modeloruns_sBA = lm(formula = RS ~ OBP + SLG, data=moneyball)
summary(modeloruns_sBA)

# Predizendo Runs Permitidas
modelorunsallowed = lm(formula = RA ~ OOBP + OSLG, data=moneyball)
summary(modelorunsallowed)

# Quanto � a Estimativa de RUns?
Runs = -804.3 + 2737.77 * 0.339 + 1584.91 *  0.430
Runs

# Calculando Runs Permitidas
RunsAllowed = -837 + 2913.6 * 0.307 + 1514.29 * 0.373
RunsAllowed

# Esse time vai chegar �s playoffs?
Vitorias = 80.88 + 0.1057 * (Runs - RunsAllowed)
if (Vitorias >= 95) {
  paste("Esse time deve chegar nas Playoffs com ", Vitorias, " vit�rias.")
} else {
  paste("Compre outros Jogadores, este time n�o chega nas playoffs com apenas ", Vitorias, " vit�rias!")
}