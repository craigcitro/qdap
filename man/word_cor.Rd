\name{word_cor}
\alias{word_cor}
\title{Find Correlated Words}
\usage{
  word_cor(text.var, grouping.var = NULL, word, r = 0.7,
    values = TRUE, method = "pearson", ...)
}
\arguments{
  \item{text.var}{The text variable (or frequency matrix).}

  \item{grouping.var}{The grouping variables.  Default
  \code{NULL} generates one word list for all text.  Also
  takes a single grouping variable or a list of 1 or more
  grouping variables.}

  \item{word}{The word(s) vector to find associated words
  for.}

  \item{r}{The correlation level find associated words for.
  If positive this is the minimum value, if negative this
  is the maximum value.}

  \item{values}{logical.  If \code{TRUE}returns the named
  correlates (names are the words).  If \code{FALSE} only
  the associated words are returned.}

  \item{method}{A character string indicating which
  correlation coefficient is to be computed
  (\code{"pearson"}, \code{"kendall"}, or
  \code{"spearman"}).}

  \item{\dots}{Other arguments passed to
  \code{\link[qdap]{wfm}}.}
}
\value{
  Returns a vector of associated words or correlation
  matrix if \code{r = NULL}.
}
\description{
  Find associated words within grouping variable(s).
}
\examples{
\dontrun{
x <- factor(with(rajSPLIT, paste(act, pad(TOT(tot)), sep = "|")))
word_cor(rajSPLIT$dialogue, x, "romeo", .45)
word_cor(rajSPLIT$dialogue, x, "love", .5)

## Negative correlation
word_cor(rajSPLIT$dialogue, x, "you", -.1)
with(rajSPLIT, word_cor(dialogue, list(person, act), "hate"))

words <- c("hate", "i", "love", "ghost")
with(rajSPLIT, word_cor(dialogue, x, words, r = .5))
with(rajSPLIT, word_cor(dialogue, x, words, r = .4))

## Set `r = NULL` to get matrix between words
with(rajSPLIT, word_cor(dialogue, x, words, r = NULL))

## Run on multiple times/person/nested
## Split and apply to data sets
## Suggested use of stemming
DATA3 <- split(DATA2, DATA2$person)

## Find correlations between words per turn of talk by person
## Throws multiple warning because small data set
lapply(DATA3, function(x) {
    word_cor(x[, "state"], ID(x), qcv(computer, i, no, good), r = NULL)
})

## Find words correlated per turn of talk by person
## Throws multiple warning because small data set
lapply(DATA3, function(x) {
    word_cor(x[, "state"], ID(x), qcv(computer, i, no, good))
})


## A real example
dat <- pres_debates2012
dat$TOT <- factor(with(dat, paste(time, pad(TOT(tot)), sep = "|")))
dat <- dat[dat$person \%in\% qcv(OBAMA, ROMNEY), ]
dat$person <- factor(dat$person)
dat.split <- with(dat, split(dat, list(person, time)))

wrds <- qcv(america, debt, dollar, people, tax, health)
lapply(dat.split, function(x) {
    word_cor(x[, "dialogue"], x[, "TOT"], wrds, r=NULL)
})

## Supply a matrix (make sure to use `t` on a `wfm` matrix)
worlis <- list(
    pronouns = c("you", "it", "it's", "we", "i'm", "i"),
    negative = qcv(no, dumb, distrust, not, stinks),
    literacy = qcv(computer, talking, telling)
)
y <- wfdf(DATA$state, ID(DATA, prefix = TRUE))
z <- wfm_combine(y, worlis)

word_cor(t(z), word = c(names(worlis), "else.words"), r = NULL)
}
}
\seealso{
  \code{\link[tm]{findAssocs}},
  \code{\link[qdap]{word_associate}},
  \code{\link[qdap]{wfm}}, \code{\link[stats]{cor}}
}
\keyword{association}
\keyword{correaltion,}
