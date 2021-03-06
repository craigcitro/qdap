\name{preprocessed}
\alias{preprocessed}
\title{Generic Preprocessed Method}
\usage{
preprocessed(x, ...)
}
\arguments{
  \item{x}{A qdap object (list) with a dataframe/list of
  preprocessed data (e.g., \code{\link[qdap]{pos_by}}).}

  \item{\ldots}{Arguments passed to preprocessed method of
  other classes.}
}
\value{
Returns a data.frame or list of preprocessed data.
}
\description{
Access the preprocessed dataframes/lists from select qdap
outputs.
}
\seealso{
\code{\link[qdap]{scores}}, \code{\link[qdap]{counts}},
\code{\link[qdap]{proportions}}, \code{\link[qdap]{visual}}
}

