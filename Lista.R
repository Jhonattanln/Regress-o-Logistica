#### Lista modelos lineares generalizados ####

# Bibliotecas
library('readxl')
library('faraway')

?faraway::wbca

### Tratamento ####
cancer <- faraway::wbca
cancer$Class <- factor(cancer$Class, levels = c(0, 1), labels = c('Benigno', 'Maligno'))

cancer_train <- cancer[0:500,]
  
cancer_test <- cancer[501:681,]
