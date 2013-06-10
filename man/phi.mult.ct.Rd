\name{phi.mult.ct}
\alias{phi.mult.ct}
\title{Initial values for the variance components in Model 3}
\usage{
  phi.mult.ct(beta.0, y, Xk, M, u1, u2)
}
\arguments{
  \item{beta.0}{a list with the initial values for the
  fixed effects per category obtained from
  \code{\link[mme]{initial.values}}.}

  \item{y}{matrix with the response variable obtained from
  \code{\link[mme]{data.mme}}. The rows are the domains and
  the columns are the categories of the response variable
  minus one.}

  \item{Xk}{list of matrices with the auxiliary variables
  per category obtained from \code{\link[mme]{data.mme}}.
  The dimension of the list is the number of domains.}

  \item{M}{vector with the sample size of the areas.}

  \item{u1}{matrix with the values for the first random
  effect obtained from \code{\link[mme]{initial.values}}.}

  \item{u2}{matrix with the values for the second random
  effect obtained from \code{\link[mme]{initial.values}}.}
}
\value{
  A list containing the following components.
  \item{phi.0}{vector of the initial values for the
  variance components.} \item{rho.0}{vector of the initial
  values for the correlation parameter.}
}
\description{
  This function is used in
  \code{\link[mme]{initial.values}} to calculate the
  initial values for the variance components in the
  multinomial mixed model with two independent random
  effects for each category of the response variable: one
  domain random effect and another correlated time and
  domain random effect (Model 3).
}
\examples{
require(Matrix)

k=3 #number of categories of the response variable
pp=c(1,1) #vector with the number of auxiliary variables in each category
mod=3  #type of model
data(simdata3) #data
D=nrow(simdata3)
datar=data.mme(simdata3,k,pp,mod)
###Fixed effects values
beta.new=list()
beta.new[[1]]=matrix(c( 1.3,-1),2,1)
beta.new[[2]]=matrix(c( -1.6,1),2,1)
## Random effects values
u1.new=rep(0.01,((k-1)*datar$d))
dim(u1.new)=c(datar$d,k-1)
u2.new=rep(0.01,((k-1)*D))
dim(u2.new)=c(D,k-1)

## Initial variance components
phi=phi.mult.ct(beta.new,datar$y,datar$Xk,datar$n,u1.new,u2.new)
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
  \code{\link[mme]{wmatrix}}, \code{\link[mme]{prmu.time}},
  \code{\link[mme]{Fbetaf.ct}},
  \code{\link[mme]{phi.direct.ct}},
  \code{\link[mme]{sPhikf.ct}}, \code{\link[mme]{ci}},
  \code{\link[mme]{modelfit3}},
  \code{\link[mme]{msef.ct}},\code{\link[mme]{omega}},
  \code{\link[mme]{mseb}}.
}
\keyword{models}

