\name{rm_stopwords}
\alias{\%sw\%}
\alias{rm_stop}
\alias{rm_stopwords}
\title{Remove Stop Words}
\usage{
rm_stopwords(text.var, stopwords = qdapDictionaries::Top25Words,
  unlist = FALSE, separate = TRUE, strip = FALSE, unique = FALSE,
  char.keep = NULL, names = FALSE, ignore.case = TRUE,
  apostrophe.remove = FALSE, ...)

rm_stop(text.var, stopwords = qdapDictionaries::Top25Words, unlist = FALSE,
  separate = TRUE, strip = FALSE, unique = FALSE, char.keep = NULL,
  names = FALSE, ignore.case = TRUE, apostrophe.remove = FALSE, ...)

text.var \%sw\% stopwords
}
\arguments{
  \item{text.var}{A character string of text or a vector of
  character strings.}

  \item{stopwords}{A character vector of words to remove
  from the text.  qdap has a number of data sets that can
  be used as stop words including: \code{Top200Words},
  \code{Top100Words}, \code{Top25Words}.  For the tm
  package's traditional English stop words use
  \code{tm::stopwords("english")}.}

  \item{unlist}{logical.  If \code{TRUE} unlists into one
  vector.  General use intended for when separate is
  \code{FALSE}.}

  \item{separate}{logical.  If \code{TRUE} separates
  sentences into words. If \code{FALSE} retains sentences.}

  \item{strip}{logical.  IF \code{TRUE} strips the text of
  all punctuation except apostrophes.}

  \item{unique}{logical.  If \code{TRUE} keeps only unique
  words (if unlist is \code{TRUE}) or sentences (if unlist
  is \code{FALSE}).  General use intended for when unlist
  is \code{TRUE}.}

  \item{char.keep}{If strip is \code{TRUE} this argument
  provides a means of retaining supplied character(s).}

  \item{names}{logical.  If \code{TRUE} will name the
  elements of the vector or list with the original
  \code{text.var}.}

  \item{ignore.case}{logical.  If \code{TRUE} stopwords
  will be removed regardless of case.  Additionally, case
  will be stripped from the text.  If \code{FALSE} stop
  word removal is contingent upon case.  Additionally, case
  is not stripped.}

  \item{apostrophe.remove}{logical.  If \code{TRUE} removes
  apostrophe's from the output.}

  \item{\ldots}{further arguments passed to
  \code{\link[qdap]{strip}} function.}
}
\value{
Returns a vector of sentences, vector of words, or
(default) a list of vectors of words with stop words
removed.  Output depends on supplied arguments.
}
\description{
Removal of stop words in a variety of contexts .

\code{\%sw\%} - Binary operator version of
\code{\link[qdap]{rm_stopwords}} that defaults to
\code{separate = FALSE}..
}
\examples{
\dontrun{
rm_stopwords(DATA$state)
rm_stopwords(DATA$state, tm::stopwords("english"))
rm_stopwords(DATA$state, Top200Words)
rm_stopwords(DATA$state, Top200Words, strip = TRUE)
rm_stopwords(DATA$state, Top200Words, separate = FALSE)
rm_stopwords(DATA$state, Top200Words, separate = FALSE, ignore.case = FALSE)
rm_stopwords(DATA$state, Top200Words, unlist = TRUE)
rm_stopwords(DATA$state, Top200Words, unlist = TRUE, strip=TRUE)
rm_stop(DATA$state, Top200Words, unlist = TRUE, unique = TRUE)

c("I like it alot", "I like it too") \%sw\% qdapDictionaries::Top25Words
}
}
\seealso{
\code{\link[qdap]{strip}}, \code{\link[qdap]{bag_o_words}},
\code{\link[tm]{stopwords}}
}
\keyword{stopwords}

