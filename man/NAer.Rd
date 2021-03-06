\name{NAer}
\alias{NAer}
\title{Replace Missing Values (NA)}
\usage{
NAer(x, replace = 0)
}
\arguments{
  \item{x}{A vector or dataframe with missing values
  (\code{NA}).}

  \item{replace}{The value to replace missing values
  (\code{NA}) with.}
}
\value{
Returns a vector or dataframe with missing values replaced.
}
\description{
Replace missing values (\code{NA}) in a vector or
dataframe.
}
\examples{
\dontrun{
set.seed(10)
(x <- sample(c(rep(NA, 4), 1:10), 20, rep=T))
NAer(x)

set.seed(10)
(y <- data.frame(matrix(x, 5, 4))                           )
NAer(y)
NAer(y, "MISSING")
}
}
\keyword{missing-value}

