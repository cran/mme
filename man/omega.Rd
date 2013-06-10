\name{omega}
\alias{omega}
\title{Model correlation matrix for Model 3}
\usage{
  omega(t, k, rho, phi2)
}
\arguments{
  \item{t}{number of time periods.}

  \item{k}{number of categories of the response variable.}

  \item{rho}{vector with the correlation parameter obtained
  from \code{\link[mme]{modelfit3}}.}

  \item{phi2}{vector with the values of the second variance
  component obtained from \code{\link[mme]{modelfit3}}.}
}
\value{
  A list containing the following components.
  \item{Omega.d}{correlation matrix.}
  \item{First.derivative.Omegad}{Fisher derivative of the
  model correlation matrix.}
}
\description{
  This function calculates the model correlation matrix and
  the first derivative of the model correlation matrix for
  Model 3. Model 3 is the multinomial mixed model with two
  independent random effects for each category of the
  response variable: one domain random effect and another
  correlated time and domain random effect.
}
\examples{
require(Matrix)

k=3 #number of categories of the response variable
pp=c(1,1) #vector with the number of auxiliary variables in each category
mod=3 #type of model
data(simdata3)   #data
datar=data.mme(simdata3,k,pp,mod)
initial=datar$initial
mean=prmu.time(datar$n,datar$Xk,initial$beta.0,initial$u1.0,initial$u2.0)

##The model correlation matrix
matrix.corr=omega(datar$t,k,initial$rho.0,initial$phi2.0)
}
\references{
  Lopez-Vizcaino, ME, Lombardia, MJ and Morales, D (2013).
  Small area estimation of labour force indicator under a
  multinomial mixed model with correlated time and area
  effects. Submitted for review.
}
\seealso{
  \code{\link[mme]{data.mme}},
  \code{\link[mme]{initial.values}},
  \code{\link[mme]{wmatrix}}
  ,\code{\link[mme]{phi.mult.ct}},
  \code{\link[mme]{prmu.time}},
  \code{\link[mme]{phi.direct.ct}},
  \code{\link[mme]{Fbetaf.ct}},
  \code{\link[mme]{sPhikf.ct}}, \code{\link[mme]{ci}},
  \code{\link[mme]{modelfit3}}, \code{\link[mme]{msef.ct}},
  \code{\link[mme]{mseb}}
}
\keyword{models}

