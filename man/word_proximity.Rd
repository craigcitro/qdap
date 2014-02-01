\name{word_proximity}
\alias{weight}
\alias{weight.word_proximity}
\alias{word_proximity}
\title{Proximity Matrix Between Words}
\usage{
word_proximity(text.var, terms, grouping.var = NULL)

weight(x, type = "scale", ...)

\method{weight}{word_proximity}(x, type = "scale", ...)
}
\arguments{
  \item{text.var}{The text variable.}

  \item{terms}{A vector of quoted terms.}

  \item{grouping.var}{The grouping variables.  Default
  \code{NULL} generates one word list for all text.  Also
  takes a single grouping variable or a list of 1 or more
  grouping variables.}

  \item{x}{An object to be weighted.}

  \item{type}{A weighting type of: c(\code{"scale_log"},
  \code{"scale"}, \code{"rev_scale"},
  \code{"rev_scale_log"}, \code{"log"}, \code{"sqrt"},
  \code{"scale_sqrt"}, \code{"rev_sqrt"},
  \code{"rev_scale_sqrt"}).  The weight type section name
  (i.e. \code{A_B_C} where \code{A}, \code{B}, and \code{C}
  are sections) determines what action will occur.
  \code{log} will use \code{\link[base]{log}}, \code{sqrt}
  will use \code{\link[base]{sqrt}}, \code{scale} will
  standardize the values.  \code{rev} will multiply by -1
  to give the inverse sign.  This enables a comparison
  cloder to correlations rather than distance.}

  \item{\dots}{ignored.}
}
\value{
Returns a list of matrices of proximity measures in the
unit of average sentences between words (defualts to
scaled).

Returns a weighted list of matrices.
}
\description{
Generate proximity measures to ascertain a mean distance
measure between word uses.

Weight a word_proximity object.

word_proximity Method for weight
}
\details{
Note that row names are the first word and column names are
the second comparison word. The values for Word A compared
to Word B will not be the same as Word B compared to Word
A. This is because, unlike a true distance measure,
\code{word+proximity}'s matrix is asymmetrical.
\code{word_proximity} computes the distance by taking each
sentence position for Word A and comparing it to the
nearest sentence location for Word B.
}
\note{
The match.terms is character sensitive.  Spacing is an
important way to grab specific words and requires careful
thought.  Using "read" will find the words "bread", "read"
"reading", and "ready".  If you want to search for just the
word "read" you'd supply a vector of c(" read ", " reads",
" reading", " reader").

A constant of .000000000001 is added to each element when
log is used to deal with the problem of \code{log(0)}.
}
\examples{
\dontrun{
wrds <- word_list(pres_debates2012$dialogue,
    stopwords = c("it's", "that's", Top200Words))
wrds2 <- tolower(sort(wrds$rfswl[[1]][, 1]))

(x <- with(pres_debates2012, word_proximity(dialogue, wrds2)))
plot(x)
plot(weight(x))
plot(weight(x, "rev_scale_log"))

(x2 <- with(pres_debates2012, word_proximity(dialogue, wrds2, person)))
}
}
