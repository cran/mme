\name{initial.values}
\alias{initial.values}
\title{Initial values for fitting algorithm to estimate the fixed and random effects and the variance components}
\usage{
  initial.values(d, pp, datar, mod)
}
\arguments{
  \item{d}{number of areas.}

  \item{pp}{vector with the number of auxiliary variables
  per category.}

  \item{datar}{output of function
  \code{\link[mme]{data.mme}}.}

  \item{mod}{a number specifying the type of model:
  1=multinomial mixed model with one independent random
  effect for each category of the response variable (Model
  1), 2=multinomial mixed model with two independent random
  effects for each category of the response variable: one
  domain random effect and another independent time and
  domain random effect (Model 2) and 3= multinomial mixed
  model with two independent random effects for each
  category of the response variable: one domain random
  effect and another correlated time and domain random
  effect (Model 3).}
}
\value{
  A list containing the following components, depending on
  the chosen model. \item{beta.0}{a list with the initial
  values for the fixed effects beta per category.}
  \item{phi.0}{vector with the initial values for the
  variance components phi of Model 1.} \item{phi1.0}{vector
  with the initial values for the variance components phi1
  of Model 2 or 3.} \item{phi2.0}{vector with the initial
  values for the variance components phi2 of Model 2 or 3.}
  \item{u}{matrix with the initial values for the random
  effect for Model 1.} \item{u1.0}{matrix with the initial
  values for the first random effect for Model 2 or 3.}
  \item{u2.0}{matrix with the initial values for the second
  random effect for Model 2 or 3.} \item{rho.0}{vector with
  the initial values for the correlation parameter for
  Model 3.}
}
\description{
  This function sets the initial values. An iterative
  algorithm fits the multinomial mixed models that requires
  initial values for the fixed effects, the random effects
  and the variance components. This initial values are used
  in \code{\link[mme]{modelfit1}},
  \code{\link[mme]{modelfit2}} and
  \code{\link[mme]{modelfit3}}.
}
\examples{
library(Matrix)

k=3 #number of categories of the response variable
pp=c(1,1) #vector with the number of auxiliary variables in each category
data(simdata)
D=nrow(simdata)
mod=1 #Type of model
datar=data.mme(simdata,k,pp,mod)

## Initial values for fixed, random effects and variance components
initial=datar$initial
}
\references{
  Lopez-Vizcaino, ME, Lombardia, MJ and Morales, D (2013).
  Multinomial-based small area estimation of labour force
  indicators. Statistical Modelling, 13, 153-178.

  Lopez-Vizcaino, ME, Lombardia, MJ and Morales, D (2013).
  Small area estimation of labour force indicators under a
  multinomial mixed model with correlated time and area
  effects. Submitted for review.
}
\seealso{
  \code{\link[mme]{data.mme}}, \code{\link[mme]{wmatrix}},
  \code{\link[mme]{phi.mult.it}},
  \code{\link[mme]{prmu.time}},
  \code{\link[mme]{Fbetaf.it}},
  \code{\link[mme]{phi.direct.it}},
  \code{\link[mme]{sPhikf.it}}, \code{\link[mme]{ci}},
  \code{\link[mme]{modelfit2}}, \code{\link[mme]{msef.it}},
  \code{\link[mme]{mseb}}
}
\keyword{models}

