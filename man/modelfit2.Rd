\name{modelfit2}
\alias{modelfit2}
\title{Function to fit Model 2}
\usage{
  modelfit2(d, t, pp, Xk, X, Z, initial, y, M, MM)
}
\arguments{
  \item{d}{number of areas.}

  \item{t}{number of time periods.}

  \item{pp}{vector with the number of the auxiliary
  variables per category.}

  \item{Xk}{list of matrices with the auxiliary variables
  per category obtained from \code{\link[mme]{data.mme}}.
  The dimension of the list is the number of domains.}

  \item{X}{list of matrices with the auxiliary variables
  obtained from \code{\link[mme]{data.mme}}. The dimension
  of the list is the number of categories of the response
  variable minus one.}

  \item{Z}{design matrix of random effects
  \code{\link[mme]{data.mme}}.}

  \item{initial}{output of the function
  \code{\link[mme]{initial.values}}.}

  \item{y}{matrix with the response variable obtained from
  \code{\link[mme]{data.mme}}, except the reference
  category. The rows are the domains and the columns are
  the categories of the response variable minus one.}

  \item{M}{vector with the area sample sizes.}

  \item{MM}{vector with the population sample sizes.}
}
\value{
  A list containing the following components.
  \item{Estimated.probabilities}{matrix with the estimated
  probabilities for the categories of response variable.}
  \item{Fisher.information.matrix.phi}{Fisher information
  matrix of the variance components.}
  \item{Fisher.information.matrix.beta}{Fisher information
  matrix of the fixed effects. } \item{u1}{matrix with the
  estimated first random effect.} \item{u2}{matrix with the
  estimated second random effect.} \item{mean}{matrix with
  the estimated mean of response variable.}
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
  This function fits the multinomial mixed model with two
  independent random effects for each category of the
  response variable: one domain random effect and another
  independent time and domain random effect (Model 2). The
  formulation is described in Lopez-Vizcaino et al. (2013).
  The fitting algorithm combines the penalized
  quasi-likelihood method (PQL) for estimating and
  predicting the fixed and random effects, respectively,
  with the residual maximum likelihood method (REML) for
  estimating the variance components. This function uses as
  initial values the output of the function
  \code{\link[mme]{initial.values}}.
}
\examples{
library(mixstock)
library(Matrix)

k=3 #number of categories of the response variable
pp=c(1,1) #vector with the number of auxiliary variables in each category
mod=2 #type of model
data(simdata2)  #data
datar=data.mme(simdata2,k,pp,mod)

##Model fit
result=modelfit2(datar$d,datar$t,pp,datar$Xk,datar$X,datar$Z,datar$initial,datar$y[,1:(k-1)],
       datar$n,datar$N)
}
\references{
  Lopez-Vizcaino, ME, Lombardia, MJ and Morales, D (2013).
  Small area estimation of labour force indicators under a
  multinomial mixed model with correlated time and area
  effects. Submitted for review.
}
\seealso{
  \code{\link[mme]{data.mme}},
  \code{\link[mme]{initial.values}},
  \code{\link[mme]{wmatrix}},
  \code{\link[mme]{phi.mult.it}},
  \code{\link[mme]{prmu.time}},
  \code{\link[mme]{phi.direct.it}},
  \code{\link[mme]{sPhikf.it}}, \code{\link[mme]{ci}},
  \code{\link[mme]{Fbetaf.it}}, \code{\link[mme]{msef.it}},
  \code{\link[mme]{mseb}}
}
\keyword{models}

