\name{multigsub}
\alias{mgsub}
\alias{multigsub}
\title{Multiple gsub}
\usage{
multigsub(pattern, replacement = NULL, text.var, leadspace = FALSE,
  trailspace = FALSE, fixed = TRUE, trim = TRUE, order.pattern = fixed,
  ...)

mgsub(pattern, replacement = NULL, text.var, leadspace = FALSE,
  trailspace = FALSE, fixed = TRUE, trim = TRUE, order.pattern = fixed,
  ...)
}
\arguments{
  \item{pattern}{Character string to be matched in the
  given character vector.}

  \item{replacement}{Character string equal in length to
  pattern or of length one which are a replacement for
  matched pattern.}

  \item{text.var}{The text variable.}

  \item{leadspace}{logical.  If \code{TRUE} inserts a
  leading space in the replacements.}

  \item{trailspace}{logical.  If \code{TRUE} inserts a
  trailing space in the replacements.}

  \item{fixed}{logical. If \code{TRUE}, pattern is a string
  to be matched as is. Overrides all conflicting
  arguments.}

  \item{trim}{logical.  If \code{TRUE} leading and trailing
  white spaces are removed.}

  \item{order.pattern}{logical.  If \code{TRUE} and
  \code{fixed = TRUE}, the \code{pattern} string is sorted
  by number of characters to prevent substrings replacing
  meta strings (e.g., \code{pattern = c("the", "then")}
  resorts to search for "then" first).}

  \item{\dots}{Additional arguments passed to
  \code{\link[base]{gsub}}.}
}
\value{
Returns a vector with the pattern replaced.
}
\description{
A wrapper for \code{\link[base]{gsub}} that takes a vector
of search terms and a vector or single value of
replacements.
}
\examples{
\dontrun{
multigsub(c("it's", "I'm"), c("it is", "I am"), DATA$state)
mgsub(c("it's", "I'm"), c("it is", "I am"), DATA$state)
mgsub("[[:punct:]]", "PUNC", DATA$state, fixed = FALSE)
}
}
\seealso{
\code{\link[base]{gsub}}
}

