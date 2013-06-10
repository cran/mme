\name{wmatrix}
\alias{wmatrix}
\title{Model variance-covariance matrix of the multinomial mixed models}
\usage{
  wmatrix(M, pr)
}
\arguments{
  \item{M}{vector with area sample sizes.}

  \item{pr}{matrix with the estimated probabilities for the
  categories of the response variable obtained from
  \code{\link[mme]{prmu}} or \code{\link[mme]{prmu.time}}.}
}
\value{
  W a list with the model variance-covariance matrices for
  each domain.
}
\description{
  This function calculates the variance-covariance matrix
  of the multinomial mixed models. Three types of
  multinomial mixed model are considered. The first model
  (Model 1), with one random effect in each category of the
  response variable; Model 2, introducing independent time
  effect; Model 3, introducing correlated time effect.
}
\examples{
require(Matrix)

k=3 #number of categories of the response variable
pp=c(1,1) #vector with the number of auxiliary variables in each category
mod=2 #type of model
data(simdata2)
datar=data.mme(simdata2,k,pp,mod)
initial=datar$initial
mean=prmu.time(datar$n,datar$Xk,initial$beta.0,initial$u1.0,initial$u2.0)
##The model variance-covariance matrix
varcov=wmatrix(datar$n,mean$estimated.probabilities)
}
\references{
  Lopez-Vizcaino, ME, Lombardia, MJ and Morales, D (2013).
  Multinomial-based small area estimation of labour force
  indicators. Statistical Modelling,13,153-178.
}
\seealso{
  \code{\link[mme]{data.mme}},
  \code{\link[mme]{initial.values}},
  \code{\link[mme]{phi.mult}}, \code{\link[mme]{prmu}},
  \code{\link[mme]{prmu.time}} \code{\link[mme]{Fbetaf}},
  \code{\link[mme]{phi.direct}}, \code{\link[mme]{sPhikf}},
  \code{\link[mme]{ci}}, \code{\link[mme]{modelfit1}},
  \code{\link[mme]{msef}}, \code{\link[mme]{mseb}}
}
\keyword{models}

