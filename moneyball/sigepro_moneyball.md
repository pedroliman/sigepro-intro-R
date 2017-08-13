Exemplo - MoneyBall
========================================================
Este exemplo usa dados relacionados ao filme "Moneyball" para apresentar a t�cnica de regress�o linear com o R.
Este exerc�cio e a ideia de usar o exemplo do Moneyball � baseda em uma aula do MIT, da plataforma Edx: https://courses.edx.org/courses/course-v1:MITx+15.071x_3+1T2016/



```r
library(knitr)
```

Lendo Dados em CSV com read.csv()
========================================================
Normalmente lemos dados no formato .csv no R para realizar as an�lises. � poss�vel tamb�m ler dados em outros formatos.


```r
# Definindo o Working Directory (pasta base na qual estaremos trabalhando).
# Esta fun��o mostra as vari�veis que temos, seus tipos e seus 
setwd("D:/DADOS/dev/sigepro-moneyball/moneyball")
```
