\name{outlier_detect}
\alias{outlier_detect}
\title{Detect Outliers in Text}
\usage{
outlier_detect(text.var, grouping.var = NULL, FUN = word_count,
  scale.by = "grouping")
}
\arguments{
  \item{text.var}{The text variable.}

  \item{grouping.var}{The grouping variables.  Default
  \code{NULL} generates one word list for all text.  Also
  takes a single grouping variable or a list of 1 or more
  grouping variables.}

  \item{FUN}{A word function with a numeric vector output
  (e.g., \code{syllable_sum}, \code{character_count} or
  \code{word_count}).}

  \item{scale.by}{A character string indicating which
  dimensions to scale by. One of \code{"all"},
  \code{"grouping"}, or \code{"both"}.  Default NULL scales
  by all.}
}
\value{
Returns a dataframe with possible outliers.
}
\description{
Locate possible outliers for text variables given numeric
word function.
}
\examples{
\dontrun{
with(DATA, outlier_detect(state))
with(DATA, outlier_detect(state, FUN = character_count))
with(DATA, outlier_detect(state, person, FUN = character_count))
with(DATA, outlier_detect(state, list(sex, adult), FUN = character_count))
with(DATA, outlier_detect(state, FUN = syllable_sum))
htruncdf(with(raj, outlier_detect(dialogue, person)), 15, 45)
}
}

