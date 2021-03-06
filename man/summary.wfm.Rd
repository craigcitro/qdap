\name{summary.wfm}
\alias{summary.wfm}
\title{Summarize a wfm object}
\usage{
\method{summary}{wfm}(object, ...)
}
\arguments{
  \item{object}{The wfm object}

  \item{\ldots}{Ignored.}
}
\description{
Summarize a wfm object with familiar tm package look.
}
\details{
\strong{Non-/sparse entries} is the ratio of non-zeros to
zero counts.  \strong{Sparsity} is that ratio represented
as a percent. \strong{Hapax legomenon} is the
number(percent) of terms that appear only once in the
dialogue. \strong{Dis legomenon} is the number(percent) of
terms that appear exactly two times once.
}
\examples{
\dontrun{
x <- with(DATA, wfm(state, list(sex, adult)))
summary(x)
}
}

