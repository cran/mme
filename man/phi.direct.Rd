\name{phi.direct}
\alias{phi.direct}
\title{Variance components for Model 1}
\usage{
  phi.direct(sigmap, phi, X, u)
}
\arguments{
  \item{sigmap}{a list with the model variance-covariance
  matrices for each domain obtained from
  \code{\link[mme]{wmatrix}}.}

  \item{X}{list of matrices with the auxiliary variables
  obtained from \code{\link[mme]{data.mme}}. The dimension
  of the list is the number of categories of the response
  variable minus one.}

  \item{phi}{vector with the initial values of the variance
  components obtained from \code{\link[mme]{modelfit1}}.}

  \item{u}{matrix with the values of the random effects
  obtained from \code{\link[mme]{modelfit1}}.}
}
\value{
  a list containing the following components.
  \item{phi.new}{vector with the variance components.}
}
\description{
  This function calculates the variance components for the
  multinomial mixed model with one independent random
  effect in each category of the response variable (Model
  1). These values are used in the second part of the
  fitting algorithm implemented in
  \code{\link[mme]{modelfit1}}. The algorithm adapts the
  ideas of Schall (1991) to a multivariate model and the
  variance components are estimated by the REML method.
}
\examples{
require(Matrix)

k=3 #number of categories of the response variable
pp=c(1,1) #vector with the number of auxiliary variables in each category
data(simdata)   #data
mod=1 #type of model
datar=data.mme(simdata,k,pp,mod)
initial=datar$initial
mean=prmu(datar$n,datar$Xk,initial$beta.0,initial$u.0)
#model variance-covariance matrix
sigmap=wmatrix(datar$n,mean$estimated.probabilities)

##Variance components
phi=phi.direct(sigmap,initial$phi.0,datar$X,initial$u.0)
}
\references{
  Lopez-Vizcaino, ME, Lombardia, MJ and Morales, D (2013).
  Multinomial-based small area estimation of labour force
  indicators. Statistical Modelling, 13 ,153-178.

  Schall, R (1991). Estimation in generalized linear models
  with random effects. Biometrika, 78,719-727.
}
\seealso{
  \code{\link[mme]{data.mme}},
  \code{\link[mme]{initial.values}},
  \code{\link[mme]{wmatrix}}, \code{\link[mme]{phi.mult}},
  \code{\link[mme]{prmu}}, \code{\link[mme]{Fbetaf}},
  \code{\link[mme]{sPhikf}}, \code{\link[mme]{ci}},
  \code{\link[mme]{modelfit1}}, \code{\link[mme]{msef}},
  \code{\link[mme]{mseb}}.
}
\keyword{models}

