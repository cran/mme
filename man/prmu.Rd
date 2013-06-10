\name{prmu}
\alias{prmu}
\title{Estimated mean and probabilities for Model 1}
\usage{
  prmu(M, Xk, beta, u)
}
\arguments{
  \item{M}{vector with the area sample sizes.}

  \item{Xk}{list of matrices with the auxiliary variables
  per category obtained from \code{\link[mme]{data.mme}}.
  The dimension of the list is the number of domains.}

  \item{beta}{fixed effects obtained from
  \code{\link[mme]{modelfit1}}.}

  \item{u}{values of random effects obtained from
  \code{\link[mme]{modelfit1}}.}
}
\value{
  A list containing the following components:
  \item{Estimated.probabilities}{matrix with the estimated
  probabilities for the categories of response variable.}
  \item{mean}{ matrix with the estimated mean of the
  response variable.} \item{eta}{matrix with the estimated
  log-rates of the probabilities of each category over the
  reference category.}
}
\description{
  This function calculates the estimated probabilities and
  the estimated mean of the response variable, in the
  multinomial mixed model with one independent random
  effect in each category of the response variable (Model
  1).
}
\examples{
require(Matrix)

k=3 #number of categories of the response variable
pp=c(1,1) #vector with the number of auxiliary variables in each category
data(simdata) #data
mod=1 #type of model
D=nrow(simdata)
datar=data.mme(simdata,k,pp,mod)
initial=datar$initial

##Estimated mean and probabilities
mean=prmu(datar$n,datar$Xk,initial$beta.0,initial$u.0)
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
  \code{\link[mme]{Fbetaf}}, \code{\link[mme]{phi.direct}},
  \code{\link[mme]{sPhikf}}, \code{\link[mme]{ci}},
  \code{\link[mme]{modelfit1}}, \code{\link[mme]{msef}},
  \code{\link[mme]{mseb}}.
}
\keyword{models}

