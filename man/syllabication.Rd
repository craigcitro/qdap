\name{syllable_sum}
\alias{combo_syllable_sum}
\alias{polysyllable_sum}
\alias{syllable_count}
\alias{syllable_sum}
\title{Syllabication}
\usage{
syllable_sum(text.var, parallel = FALSE)

syllable_count(text, remove.bracketed = TRUE, algorithm.report = FALSE)

polysyllable_sum(text.var, parallel = FALSE)

combo_syllable_sum(text.var, parallel = FALSE)
}
\arguments{
  \item{text.var}{The text variable}

  \item{parallel}{logical.  If \code{TRUE} attempts to run
  the function on multiple cores.  Note that this may not
  mean a speed boost if you have one core or if the data
  set is smaller as the cluster takes time to create.}

  \item{text}{A single character vector of text.}

  \item{remove.bracketed}{logical.  If \code{TRUE} brackets
  are removed from the analysis.}

  \item{algorithm.report}{logical.  If \code{TRUE}
  generates a report of words not found in the dictionary
  (i.e., syllables were calculated with an algorithm).}
}
\value{
\code{syllable_sum} - returns a vector of syllable counts
per row.

\code{syllable_count} - returns a dataframe of syllable
counts and algorithm/dictionary uses and, optionally, a
report of words not found in the dictionary.

\code{polysyllable_sum} - returns a vector of polysyllable
counts per row.

\code{combo_syllable_sum} - returns a dataframe of syllable
and polysyllable counts per row.
}
\description{
\code{syllable_sum} - Count the number of syllables per row
of text.

\code{syllable_count} - Count the number of syllables in a
single text string.

\code{polysyllable_sum} - Count the number of polysyllables
per row of text.

\code{combo_syllable_sum} - Count the number of both
syllables and polysyllables per row of text.
}
\details{
The worker function of all the syllable functions is
\code{\link[qdap]{syllable_count}}, though it is not
intended for direct use on a transcript.  This function
relies on a combined dictionary lookup (based on the
Nettalk Corpus (Sejnowski & Rosenberg, 1987)) and backup
algorithm method.
}
\examples{
\dontrun{
syllable_count("Robots like Dason lie.")
syllable_count("Robots like Dason lie.", algorithm.report = TRUE)
syllable_sum(DATA$state)
polysyllable_sum(DATA$state)
combo_syllable_sum(DATA$state)
}
}
\references{
Sejnowski, T.J., and Rosenberg, C.R. (1987). "Parallel
networks that learn to pronounce English text" in Complex
Systems, 1, 145-168.
}
\keyword{polysyllable}
\keyword{syllabication,}
\keyword{syllable,}

