\name{trans_venn}
\alias{trans_venn}
\title{Venn Diagram by Grouping Variable}
\usage{
trans_venn(text.var, grouping.var, stopwords = NULL, rm.duplicates = TRUE,
  title = TRUE, title.font = NULL, title.color = "black",
  title.cex = NULL, title.name = NULL, legend = TRUE, legend.cex = 0.8,
  legend.location = "bottomleft", legend.text.col = "black",
  legend.horiz = FALSE, ...)
}
\arguments{
  \item{text.var}{The text variable.}

  \item{grouping.var}{The grouping variables.  Default
  \code{NULL} generates one word list for all text.  Also
  takes a single grouping variable or a list of 1 or more
  grouping variables.}

  \item{stopwords}{Words to exclude from the analysis.}

  \item{rm.duplicates}{logical.  If \code{TRUE} removes the
  duplicated words from the analysis (only single usage is
  considered).}

  \item{title}{logical.  IF \code{TRUE} adds a title
  corresponding to the \code{grouping.var}.}

  \item{title.font}{The font family of the cloud title.}

  \item{title.color}{A character vector of length one
  corresponding to the color of the title.}

  \item{title.cex}{Character expansion factor for the
  title. \code{NULL} and \code{NA} are equivalent to 1.0}

  \item{title.name}{A title for the plot.}

  \item{legend}{logical.  If \code{TRUE} uses the names
  from the \code{target.words} list corresponding to
  cloud.colors.}

  \item{legend.cex}{Character expansion factor for the
  legend. \code{NULL} and \code{NA} are equivalent to 1.0.}

  \item{legend.location}{The x and y co-ordinates to be
  used to position the legend.  The location may also be
  specified by setting x to a single keyword from the list
  \code{"bottomright"}, \code{"bottom"},
  \code{"bottomleft"}, \code{"left"}, \code{"topleft"},
  \code{"top"}, \code{"topright"}, \code{"right"} and
  \code{"center"}. This places the legend on the inside of
  the plot frame at the given location.}

  \item{legend.text.col}{The color used for the legend
  text.}

  \item{legend.horiz}{logical; if \code{TRUE}, set the
  legend horizontally rather than vertically.}

  \item{\dots}{Other arguments passed to plot.}
}
\value{
Returns a Venn plot by grouping variable(s).
}
\description{
Produce a Venn diagram by grouping variable.
}
\section{Warning}{
  The algorithm used to overlap the Venn circles becomes
  increasingly overburdened and less accurate with
  increased grouping variables. An alternative is to use a
  network plot with \{code{\link[qdap]{Dissimilarity}}
  measures labeling the edges between nodes (grouping
  variables) or a heat map (\code{\link[qdap]{qheat}}).
}
\examples{
\dontrun{
with(DATA , trans_venn(state, person, legend.location = "topright"))
#the plot below will take a considerable amount of time to plot
with(raj.act.1 , trans_venn(dialogue, person, legend.location = "topleft"))
}
}
\seealso{
\code{\link[venneuler]{venneuler}}
}
\keyword{venn}

