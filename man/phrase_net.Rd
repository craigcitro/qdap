\name{phrase_net}
\alias{phrase_net}
\title{Phrase Nets}
\usage{
phrase_net(text.var, freq = 4, r = 0.35, edge.constant = 6,
  vertex.constant = 3, ...)
}
\arguments{
  \item{text.var}{The text variable.}

  \item{freq}{The minimum word frequency occurrence.}

  \item{r}{The minimum correlation value}

  \item{edge.constant}{A constant to multiple the edges
  by.}

  \item{vertex.constant}{A constant to multiple the vertex
  label sizes by.}

  \item{\ldots}{Other arguments passed to
  \code{\link[qdap]{Filter}}.}
}
\value{
Returns an igraph object.
}
\description{
Create
\href{http://www-958.ibm.com/software/data/cognos/manyeyes/}{Many
Eyes} style phrase nets.
}
\note{
While
\href{http://www-958.ibm.com/software/data/cognos/manyeyes/}{Many
Eyes} phrase nets inspired this function the two outputs
are not identical.  The \code{\link[qdap]{phrase_net}}
function operates off of correlations between words in
sentences.
}
\examples{
\dontrun{
x <- "Questions must be at least 2 days old to be eligible for a bounty.
    There can only be 1 active bounty per question at any given time.
    Users must have at least 75 reputation to offer a bounty, and may
    only have a maximum of 3 active bounties at any given time. The
    bounty period lasts 7 days. Bounties must have a minimum duration of
    at least 1 day. After the bounty ends, there is a grace period of 24
    hours to manually award the bounty. If you do not award your bounty
    within 7 days (plus the grace period), the highest voted answer
    created after the bounty started with at least 2 upvotes will be
    awarded half the bounty amount. If there's no answer meeting that
    criteria, the bounty is not awarded to anyone. If the bounty was
    started by the question owner, and the question owner accepts an
    answer during the bounty period, and the bounty expires without an
    explicit award - we assume the bounty owner liked the answer they
    accepted and award it the full bounty amount at the time of bounty
    expiration. In any case, you will always give up the amount of
    reputation specified in the bounty, so if you start a bounty, be sure
    to follow up and award your bounty to the best answer! As an
    additional bonus, bounty awards are immune to the daily reputation
    cap and community wiki mode."

dat <- sentSplit(data.frame(text = qprep(x)), "text")

phrase_net(dat$text, r=.5)
library(igraph)
plot(phrase_net(dat$text, r=.5), edge.curved = FALSE)
}
}
\references{
\url{http://www-01.ibm.com/software/analytics/many-eyes/}
}
\keyword{phrase_net}

