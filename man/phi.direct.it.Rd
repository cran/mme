\name{phi.direct.it}
\alias{phi.direct.it}
\title{Variance components for Model 2}
\usage{
  phi.direct.it(pp, sigmap, X, phi1, phi2, u1, u2)
}
\arguments{
  \item{pp}{vector with the number of auxiliary variables
  per category.}

  \item{sigmap}{a list with the model variance-covariance
  matrices for each domain obtained from
  \code{\link[mme]{wmatrix}}.}

  \item{X}{list of matrices with the auxiliary variables
  obtained from \code{\link[mme]{data.mme}}. The dimension
  of the list is the number of categories of the response
  variable.}

  \item{phi1}{vector with the initial values of the first
  variance component obtained from
  \code{\link[mme]{modelfit2}}.}

  \item{phi2}{vector with the initial values of the second
  variance component obtained from
  \code{\link[mme]{modelfit2}}.}

  \item{u1}{matrix with the values of the first random
  effect obtained from \code{\link[mme]{modelfit2}}.}

  \item{u2}{matrix with the values of the second random
  effect obtained from \code{\link[mme]{modelfit2}}.}
}
\value{
  a list containing the following components.
  \item{phi1.new}{vector with the values of the variance
  component for the first random effect.}
  \item{phi2.new}{vector with the values of the variance
  component for the second random effect.}
}
\description{
  This function calculates the variance components for the
  multinomial mixed model with two independent random
  effects for each category of the response variable: one
  domain random effect and another independent time and
  domain random effect (Model 2). This variance components
  are used in the second part of the fitting algorithm
  implemented in \code{\link[mme]{modelfit2}}. The
  algorithm adapts the ideas of Schall (1991) to a
  multivariate model. The variance components are estimated
  by the REML method.
}
\examples{
require(Matrix)

k=3 #number of categories of the response variable
pp=c(1,1) #vector with the number of auxiliary variables in each category
d=10 #number of areas
mod=2  #Type of model
data(simdata2)   #data
datar=data.mme(simdata2,k,pp,mod)
initial=datar$initial
mean=prmu.time(datar$n,datar$Xk,initial$beta.0,initial$u1.0,initial$u2.0)
sigmap=wmatrix(datar$n,mean$estimated.probabilities) #variance-covariance

## The variance components
phi.it=phi.direct.it(pp,sigmap,datar$X,initial$phi1.0,initial$phi2.0,
       initial$u1.0,initial$u2.0)
}
\references{
  Lopez-Vizcaino, ME, Lombardia, MJ and Morales, D (2013).
  Small area estimation of labour force indicators under a
  multinomial mixed model with correlated time and area
  effects. Submitted for review.

  Schall, R (1991). Estimation in generalized linear models
  with random effects. Biometrika, 78,719-727.
}
\seealso{
  \code{\link[mme]{data.mme}},
  \code{\link[mme]{initial.values}},
  \code{\link[mme]{wmatrix}},
  \code{\link[mme]{phi.mult.it}},
  \code{\link[mme]{prmu.time}},
  \code{\link[mme]{Fbetaf.it}}
  \code{\link[mme]{sPhikf.it}}, \code{\link[mme]{ci}},
  \code{\link[mme]{modelfit2}}, \code{\link[mme]{msef.it}},
  \code{\link[mme]{mseb}}
}
\keyword{models}

