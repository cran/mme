\name{model}
\alias{model}
\title{Choose between the three models}
\usage{
  model(d, t, pp, Xk, X, Z, initial, y, M, MM, mod)
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

  \item{Z}{design matrix of random effects obtained from
  \code{\link[mme]{data.mme}}.}

  \item{initial}{output of the function
  \code{\link[mme]{initial.values}}.}

  \item{y}{matrix with the response variable obtained from
  \code{\link[mme]{data.mme}}. The rows are the domains and
  the columns are the categories of the response variable.}

  \item{M}{vector with the area sample sizes.}

  \item{MM}{vector with the population sample sizes.}

  \item{mod}{a number specifying the type of models:
  1=multinomial mixed model with one independent random
  effect in each category of the response variable (Model
  1), 2=multinomial mixed model with two independent random
  effects in each category of the response variable: one
  domain random effect and another independent time and
  domain random effect (Model 2) and 3= multinomial model
  with two independent random effects in each category of
  the response variable: one domain random effect and
  another correlated time and domain random effect (Model
  3).}
}
\value{
  the output of the function \code{\link[mme]{modelfit1}},
  \code{\link[mme]{modelfit2}} or
  \code{\link[mme]{modelfit3}}.
}
\description{
  This function chooses one of the three models.
}
\examples{
k=3 #number of categories of the response variable
pp=c(1,1) #vector with the number of auxiliary variables in each category
data(simdata)  #data
mod=1 #Model 1
datar=data.mme(simdata,k,pp,mod)
result=model(datar$d,datar$t,pp,datar$Xk,datar$X,datar$Z,datar$initial,datar$y[,1:(k-1)],
datar$n,datar$N, mod)
}
\references{
  Lopez-Vizcaino, ME, Lombardia, MJ and Morales, D (2013).
  Multinomial-based small area estimation of labour force
  indicators. Statistical Modelling, 13 ,153-178.

  Lopez-Vizcaino, ME, Lombardia, MJ and Morales, D (2013).
  Small area estimation of labour force indicator under a
  multinomial mixed model with correlated time and area
  effects. Submitted for review.
}
\keyword{models}

