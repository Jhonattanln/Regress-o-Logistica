#### Lista modelos lineares generalizados ####

# Bibliotecas
library(faraway)
library(performance)
library(statmod)
library(hnp)
library(MASS)

?faraway::wbca

### Tratamento ####
cancer <- faraway::wbca
cancer$Class <- factor(cancer$Class, levels = c(0, 1), labels = c('Benigno', 'Maligno'))

cancer_train <- cancer[0:500,]
  
cancer_test <- cancer[501:681,]

tabela <- with(cancer, table(BNucl, Class))
round(prop.table(tabela))

par(las = 1, mar = c(5,4.5,2,2), mfrow = c(1,2), cex = 1.25)
boxplot(UShap ~ Class, data = cancer, col = c('blue', 'red'), ylab = 'UShap')
boxplot(BNucl ~ Class, data = cancer, col = c('blue', 'red'), ylab = 'BNucl')

#### Regressão Logistica ####

ajuste <- glm(Class ~., data = cancer_train, family = binomial(link = 'logit'))
options(scipen = 5)
sumary(ajuste)

plot(ajuste)


#### Analise de residuos ####

residuos <- statmod::qres.binom(ajuste)
ajustados <- predict(ajuste)

?par
par(las=0, mar=c(5, 4, 4, 2))
plot(residuos ~ ajustados, col = 'blue', xlab = 'Valores Ajustados', ylab='Resíduos')

par(las = 1, mar = c(5, 4, 4, 2), cex = 1.4)
hnp(ajuste)
