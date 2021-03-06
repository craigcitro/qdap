\name{left_just}
\alias{left_just}
\alias{right_just}
\title{Text Justification}
\usage{
left_just(dataframe, column = NULL, keep.class = FALSE)

right_just(dataframe)
}
\arguments{
  \item{dataframe}{A data.frame object with the text
  column.}

  \item{column}{The column to be justified.  If \code{NULL}
  all columns are justified.}

  \item{keep.class}{logical.  If \code{TRUE} will attempt
  to keep the original classes of the dataframe if the
  justification is not altered (i.e., numeric will not be
  honored but factor may be).}
}
\value{
Returns a dataframe with selected text column left/right
justified.
}
\description{
\code{left_just} - Left justifies a text/character column.

\code{right_just} - A means of undoing a left
justification.
}
\note{
\code{\link[qdap]{left_just}} inserts spaces to achieve the
justification.  This could interfere with analysis and
therefore the output from \code{\link[qdap]{left_just}}
should only be used for visualization purposes, not
analysis.
}
\examples{
\dontrun{
left_just(DATA)
left_just(DATA, "state")
left_just(CO2[1:15,])
right_just(left_just(CO2[1:15,]))
}
}
\keyword{justification}
\keyword{justify,}

