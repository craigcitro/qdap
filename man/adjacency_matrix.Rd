\name{adjacency_matrix}
\alias{adjacency_matrix}
\alias{adjmat}
\title{Takes a Matrix and Generates an Adjacency Matrix}
\usage{
adjacency_matrix(matrix.obj)

adjmat(matrix.obj)
}
\arguments{
  \item{matrix.obj}{A matrix object, preferably, of the
  class "termco" generated from \code{\link[qdap]{termco}},
  \code{\link[qdap]{termco_d}} or
  \code{\link[qdap]{termco_c}}.}
}
\value{
Returns list: \item{boolean}{A Boolean matrix}
\item{adjacency}{An adjacency matrix.  Diagonals are the
total (sum) number of occurrences a variable had}
\item{shared}{An adjacency matrix with no diagonal and the
upper triangle replaced with NA} \item{sum}{The diagonal of
the adjacency matrix; the total (sum) number of occurrences
a variable had}
}
\description{
Takes a matrix (wfm) or termco object and generates an
adjacency matrix for use with the
\href{http://igraph.sourceforge.net/}{igraph} package.
}
\examples{
\dontrun{
words <- c(" you", " the", "it", "oo")
Terms <- with(DATA, termco(state, list(sex, adult), words))
Terms
adjacency_matrix(Terms)

wordLIST <- c(" montague", " capulet", " court", " marry")
raj.termco <- with(raj.act.1, termco(dialogue, person, wordLIST))
raj.adjmat <- adjmat(raj.termco)
names(raj.adjmat)  #see what's available from the adjacency_matrix object
library(igraph)
g <- graph.adjacency(raj.adjmat$adjacency, weighted=TRUE, mode ="undirected")
g <- simplify(g)
V(g)$label <- V(g)$name
V(g)$degree <- degree(g)
plot(g, layout=layout.auto(g))
}
}
\seealso{
\code{\link[stats]{dist}}
}
\keyword{Boolean-matrix}
\keyword{adjacency-matrix,}

