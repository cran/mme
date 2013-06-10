\name{Fbetaf}
\alias{Fbetaf}
\title{Inverse of the Fisher information matrix of the fixed and random effects in Model 1}
\usage{
  Fbetaf(sigmap, X, Z, phi, y, mu, u)
}
\arguments{
  \item{sigmap}{a list with the model variance-covariance
  matrices for each domain.}

  \item{X}{list of matrices with the auxiliary variables
  obtained from \code{\link[mme]{data.mme}}. The dimension
  of the list is the number of categories of the response
  variable.}

  \item{Z}{design matrix of random effects.}

  \item{phi}{vector with the values of the variance
  components obtained from \code{\link[mme]{modelfit1}}.}

  \item{y}{matrix with the response variable except the
  reference category. The rows are the domains and the
  columns are the categories of the response variable minus
  one.}

  \item{mu}{matrix with the estimated mean of the response
  variable obtained from \code{\link[mme]{prmu}}.}

  \item{u}{matrix with the values of random effects
  obtained from \code{\link[mme]{modelfit1}}.}
}
\value{
  A list containing the following components.
  \item{F.beta.beta}{the first diagonal element of the
  inverse of the Fisher information matrix.}
  \item{F.beta.u}{the element out of the diagonal of the
  inverse of the Fisher information matrix.}
  \item{F.u.u}{the second diagonal element of the inverse
  of the Fisher information matrix.} \item{S.beta}{beta
  scores.} \item{S.u}{u scores.}
}
\description{
  This function calculates the inverse of the Fisher
  information matrix of the fixed effects (beta) and the
  random effects (u) and the score vectors S.beta and S.u,
  for the model with one independent random effect in each
  category of the response variable (Model 1).
  \code{\link[mme]{modelfit1}} uses the output of this
  function to estimate the fixed and random effects by the
  PQL method.
}
\examples{
require(Matrix)

k=3 #number of categories of the response variable
pp=c(1,1) #vector with the number of auxiliary variables in each category
data(simdata) #data
mod=1 #type of model
datar=data.mme(simdata,k,pp,mod)
initial=datar$initial
mean=prmu(datar$n,datar$Xk,initial$beta.0,initial$u.0)
sigmap=wmatrix(datar$n,mean$estimated.probabilities)

#Inverse of the Fisher information matrix
Fisher=Fbetaf(sigmap,datar$X,datar$Z,initial$phi.0,datar$y[,1:(k-1)],
       mean$mean,initial$u.0)
}
\references{
  Lopez-Vizcaino, ME, Lombardia, MJ and Morales, D (2013).
  Multinomial-based small area estimation of labour force
  indicators. Statistical Modelling, 13 ,153-178.
}
\seealso{
  \code{\link[mme]{data.mme}},
  \code{\link[mme]{initial.values}},
  \code{\link[mme]{wmatrix}}, \code{\link[mme]{phi.mult}},
  \code{\link[mme]{prmu}}, \code{\link[mme]{phi.direct}},
  \code{\link[mme]{sPhikf}}, \code{\link[mme]{ci}},
  \code{\link[mme]{modelfit1}}, \code{\link[mme]{msef}},
  \code{\link[mme]{mseb}}.
}
\keyword{models}

