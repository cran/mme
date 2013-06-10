\name{modelfit1}
\alias{modelfit1}
\title{Function used to fit Model 1}
\usage{
  modelfit1(pp, Xk, X, Z, initial, y, M, MM)
}
\arguments{
  \item{pp}{vector with the number of the auxiliary
  variables per category.}

  \item{Xk}{list of matrices with the auxiliary variables
  per category obtained from \code{\link[mme]{data.mme}}.
  The dimension of the list is the number of domains.}

  \item{X}{list of matrices with the auxiliary variables
  obtained from \code{\link[mme]{data.mme}}. The dimension
  of the list is the number of categories of the response
  variable minus one.}

  \item{Z}{design matrix of random effects obtained from
  \code{\link[mme]{data.mme}}.}

  \item{initial}{output of the function
  \code{\link[mme]{initial.values}}.}

  \item{y}{matrix with the response variable except the
  reference category obtained from
  \code{\link[mme]{data.mme}}. The rows are the domains and
  the columns are the categories of the response variable
  minus 1.}

  \item{M}{vector with the area sample sizes.}

  \item{MM}{vector with the population sample sizes.}
}
\value{
  A list containing the following components.
  \item{Estimated.probabilities}{matrix with the estimated
  probabilities for the categories of response variable.}
  \item{Fisher.information.matrix.phi}{Fisher information
  matrix of the random effect.}
  \item{Fisher.information.matrix.beta}{Fisher information
  matrix of the fixed effect.} \item{u}{matrix with the
  estimated random effects.} \item{mean}{matrix with the
  estimated mean of the response variable.}
  \item{warning1}{0=OK,1=The model could not be fitted.}
  \item{warning2}{0=OK,1=The value of the variance
  component is negative: the initial value is taken.}
  \item{beta.Stddev.p.value}{matrix with the estimated
  fixed effects, its standard deviations and its p-values.}
  \item{phi.Stddev.p.value}{matrix with the estimated
  variance components, its standard deviations and its
  p-values.}
}
\description{
  This function fits the multinomial mixed model with one
  independent random effect per category of the response
  variable (Model 1), like in the formulation described in
  Lopez-Vizcaino et al. (2013). The fitting algorithm
  combines the penalized quasi-likelihood method (PQL) for
  estimating and predicting the fixed and random effects
  with the residual maximum likelihood method (REML) for
  estimating the variance components. This function uses as
  initial values the output of the function
  \code{\link[mme]{initial.values}}
}
\examples{
library(Matrix)

k=3 #number of categories of the response variable
pp=c(1,1) #vector with the number of auxiliary variables in each category
data(simdata)  #data
mod=1 #type of model
datar=data.mme(simdata,k,pp,mod)

#Model fit
result=modelfit1(pp,datar$Xk,datar$X,datar$Z,datar$initial,datar$y[,1:(k-1)],
      datar$n,datar$N)
}
\references{
  Lopez-Vizcaino, ME, Lombardia, MJ and Morales, D (2013).
  Multinomial-based small area estimation of labour force
  indicators. Statistical Modelling, 13, 153-178.
}
\seealso{
  \code{\link[mme]{data.mme}},
  \code{\link[mme]{initial.values}},
  \code{\link[mme]{wmatrix}}, \code{\link[mme]{phi.mult}},
  \code{\link[mme]{prmu}}, \code{\link[mme]{phi.direct}},
  \code{\link[mme]{sPhikf}}, \code{\link[mme]{ci}},
  \code{\link[mme]{Fbetaf}}, \code{\link[mme]{msef}},
  \code{\link[mme]{mseb}}.
}
\keyword{models}

