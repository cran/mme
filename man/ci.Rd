\name{ci}
\alias{ci}
\title{Standard deviation and p-values of the estimated model parameters}
\usage{
  ci(a, F)
}
\arguments{
  \item{a}{vector with the estimated parameters obtained
  from \code{\link[mme]{modelfit1}},
  \code{\link[mme]{modelfit2}} or
  \code{\link[mme]{modelfit3}}.}

  \item{F}{inverse of the Fisher Information Matrix
  obtained from \code{\link[mme]{modelfit1}},
  \code{\link[mme]{modelfit2}} or
  \code{\link[mme]{modelfit3}}.}
}
\value{
  A list containing the following components.
  \item{Std.dev}{vector with the standard deviations of the
  parameters. The parameters are sorted per category. }
  \item{p.value}{vector with the p-values of the parameters
  for testing H0:a=0.}
}
\description{
  This function calculates the standard deviations and the
  p-values of the estimated model parameters. The standard
  deviations are obtained from the asymptotic Fisher
  information matrix in the fitting algorithms
  \code{\link[mme]{modelfit1}},
  \code{\link[mme]{modelfit2}},
  \code{\link[mme]{modelfit3}}, depending of the current
  multinomial mixed model.
}
\examples{
library(Matrix)

k=3 #number of categories of the response variable
pp=c(1,1) #vector with the number of auxiliary variables in each category
data(simdata) #data
mod=1  #Type of model
datar=data.mme(simdata,k,pp,mod)

#Model fit
result=modelfit1(pp,datar$Xk,datar$X,datar$Z,datar$initial,datar$y[,1:(k-1)],
       datar$n,datar$N)
beta=result[[8]][,1] #fixed effects
Fisher=result[[3]] #Fisher information matrix

##Standard deviation and p-values
res=ci(beta,Fisher)
}
\references{
  Lopez-Vizcaino, ME, Lombardia, MJ and Morales, D (2013).
  Multinomial-based small area estimation of labour force
  indicators. Statistical Modelling, 13, 153-178.
}
\seealso{
  \code{\link[mme]{modelfit1}},
  \code{\link[mme]{modelfit2}},
  \code{\link[mme]{modelfit3}}.
}
\keyword{models}

