% Generated by roxygen2 (4.0.1): do not edit by hand
\docType{data}
\name{simdata}
\alias{simdata}
\title{Dataset for Model 1}
\format{A data frame with 15 rows and 9 variables in columns}
\usage{
simdata
}
\description{
Dataset used by the multinomial mixed effects model with one independent random effect in
each category of the response variable (Model 1).  This dataset contains
15 small areas. The response variable has three categories. The last
is the reference category.
The variables are as follows:
}
\details{
\itemize{
\item area: area indicator.
\item Time: time indicator.
\item sample: the sample size of each domain.
\item Population: the population size of each domain.
\item Y1: the first category of the response variable.
\item Y2: the second category of the response variable.
\item Y3: the third category of the response variable.
\item X1: the covariate for the first category of the response variable.
\item X2: the covariate for the second category of the response variable.
}
}
\examples{
k=3 #number of categories of the response variable
pp=c(1,1) #vector with the number of auxiliary variables in each category
data(simdata)  #data
mod=1 # type of model
datar=data.mme(simdata,k,pp,mod)
# Model fit
result=model(datar$d,datar$t,pp,datar$Xk,datar$X,datar$Z,datar$initial,datar$y[,1:(k-1)],
       datar$n,datar$N,mod)

#Analytic MSE
mse=msef(pp,datar$X,datar$Z,result,datar$N,datar$n)

B=1    #Bootstrap iterations
ss=12345 #SEED
set.seed(ss)

##Bootstrap parametric BIAS and MSE
mse.pboot=mseb(pp,datar$Xk,datar$X,datar$Z,datar$n,datar$N,result,B,mod)
}
\keyword{datasets}

