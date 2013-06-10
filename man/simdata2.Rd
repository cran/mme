\docType{data}
\name{simdata2}
\alias{simdata2}
\title{Dataset for Model 2}
\format{A data frame with 30 rows and 9 variables in columns}
\description{
  Dataset used by the multonomial mixed effects model with
  two independent random effects in each category of the
  response variable: one domain random effect and another
  independent time and domain random effect (Model 2). This
  dataset contains 10 small areas and two periods. The
  response variable has three categories. The last is the
  reference category. The variables are as follows:
}
\details{
  \itemize{ \item area: area indicator. \item Time: time
  indicator. \item sample: the sample size of each domain.
  \item Population: the population size of each domain.
  \item Y1: the first category of the response variable.
  \item Y2: the second category of the response variable.
  \item Y3: the third category of the response variable.
  \item X1: the covariate for the first category of the
  response variable. \item X2: the covariate for the second
  category of the response variable. }
}
\examples{
library(mixstock)
library(Matrix)

k=3 #number of categories of the response variable
pp=c(1,1) #vector with the number of auxiliary variables in each category
data(simdata2)
mod=2 #type of model
datar=data.mme(simdata2,k,pp,mod)

##Model fit
result=model(datar$d,datar$t,pp,datar$Xk,datar$X,datar$Z,datar$initial,datar$y[,1:(k-1)],
       datar$n,datar$N,mod)

##Analytic MSE
msef=msef.it(pp,datar$X,result,datar$n,datar$N)

B=1    #Bootstrap iterations
ss=12345 #SEED
set.seed(ss)

##Bootstrap parametric BIAS and MSE
mse.pboot=mseb(pp,datar$Xk,datar$X,datar$Z,datar$n,datar$N,result,B,mod)
}
\keyword{datasets}

