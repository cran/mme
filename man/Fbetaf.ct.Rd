\name{Fbetaf.ct}
\alias{Fbetaf.ct}
\title{Inverse of the Fisher information matrix of fixed and random effects in Model 3}
\usage{
  Fbetaf.ct(sigmap, X, Z, phi1, phi2, y, mu, u1, u2, rho)
}
\arguments{
  \item{sigmap}{a list with the model variance-covariance
  matrices for each domain obtained from
  \code{\link[mme]{wmatrix}}.}

  \item{X}{list of matrices with the auxiliary variables
  obtained from \code{\link[mme]{data.mme}}. The dimension
  of the list is the number of categories of the response
  variable minus one.}

  \item{Z}{design matrix of random effects.}

  \item{phi1}{vector with the values of the variance
  components for the first random effects obtained from
  \code{\link[mme]{modelfit3}}.}

  \item{phi2}{vector with the values of the variance
  components for the second random effects obtained from
  \code{\link[mme]{modelfit3}}.}

  \item{y}{matrix with the response variable, except the
  reference category. The rows are the domains and the
  columns are the categories of the response variable minus
  one.}

  \item{mu}{matrix with the estimated mean of the response
  variable.}

  \item{u1}{matrix with the values of the first random
  effect obtained from \code{\link[mme]{modelfit3}}.}

  \item{u2}{matrix with the values of the second random
  effect obtained from \code{\link[mme]{modelfit3}}.}

  \item{rho}{vector with the values of the correlation
  parameter obtained from \code{\link[mme]{modelfit3}}.}
}
\value{
  A list containing the following components. \item{F}{the
  inverse of the Fisher information matrix of (beta, u1,
  u2).} \item{S}{(beta, u1, u2) score vectors}
}
\description{
  This function calculates the score vector S and the
  inverse of the Fisher information matrix for the fixed
  (beta) and the random effects (u1, u2) in Model 3. This
  model has two independet sets of random effects. The
  first one contains independent random effects u1dk
  associated to each category and domain. The second set
  contains random effects u2dkt associated to each
  category, domain and time period. Model 3 assumes that
  the u2dk are AR(1) correlated across time.
  \code{\link[mme]{modelfit3}} uses the output of this
  function to estimate the fixed and random effect by the
  PQL method.
}
\examples{
require(Matrix)

k=3 #number of categories of the response variable
pp=c(1,1) #vector with the number of auxiliary variables in each category
mod=3 #type of model
data(simdata3)
datar=data.mme(simdata3,k,pp,mod)
initial=datar$initial
mean=prmu.time(datar$n,datar$Xk,initial$beta.0,initial$u1.0,initial$u2.0)
sigmap=wmatrix(datar$n,mean$estimated.probabilities) #variance-covariance

##The inverse of the Fisher information matrix and the score matrix
Fisher.beta=Fbetaf.ct(sigmap,datar$X,datar$Z,initial$phi1.0,initial$phi2.0,
         datar$y[,1:(k-1)],mean$mean,initial$u1.0,initial$u2.0,initial$rho.0)
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
  \code{\link[mme]{phi.mult.ct}},
  \code{\link[mme]{prmu.time}},
  \code{\link[mme]{phi.direct.ct}},
  \code{\link[mme]{sPhikf.ct}}, \code{\link[mme]{ci}},
  \code{\link[mme]{modelfit3}}, \code{\link[mme]{msef.ct}},
  \code{\link[mme]{omega}}, \code{\link[mme]{mseb}}
}
\keyword{models}

