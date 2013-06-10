\name{mmedata}
\alias{mmedata}
\title{Create objects of class mmedata}
\usage{
  mmedata(fi, k, pp)
}
\arguments{
  \item{fi}{input data set with (d X t) rows and
  4+k+sum(pp) columns. The first four columns of the data
  set are, in this order: the area indicator (integer), the
  time indicator (integer), the sample size of each domain
  and the population size of each domain. The following k
  columns are the categories of the response variable.
  Then, the auxiliary variables: first, the auxiliary
  variables of the first category, second, the auxiliary
  variables of the second category, and so on. Examples of
  input data set are in \code{\link[mme]{simdata}},
  \code{\link[mme]{simdata2}} and
  \code{\link[mme]{simdata3}}.}

  \item{k}{number of categories of the response variable.}

  \item{pp}{vector with the number of auxiliary variables
  per category.}
}
\description{
  This function creates objects of class mmedata.
}
\examples{
k=3 #number of categories of the response variable
pp=c(1,1) #vector with the number of auxiliary variables in each category
data(simdata)
r=mmedata(simdata,k,pp)
}
\seealso{
  \code{\link[mme]{modelfit1}},
  \code{\link[mme]{modelfit2}},
  \code{\link[mme]{modelfit3}}
}
\keyword{data}

