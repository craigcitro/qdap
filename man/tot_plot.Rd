\name{tot_plot}
\alias{tot_plot}
\title{Visualize Word Length by Turn of Talk}
\usage{
tot_plot(dataframe, text.var, grouping.var = NULL, facet.vars = NULL,
  tot = TRUE, transform = FALSE, ncol = NULL, ylab = NULL,
  xlab = NULL, bar.space = 0, scale = NULL, space = NULL, plot = TRUE)
}
\arguments{
  \item{dataframe}{A dataframe that contains the text
  variable and optionally the grouping.var and tot
  variables.}

  \item{text.var}{The text variable (character string).}

  \item{grouping.var}{The grouping variables to color by.
  Default \code{NULL} colors everything in "black".  Also
  takes a single grouping variable or a list of 1 or more
  grouping variables.}

  \item{facet.vars}{An optional single vector or list of 1
  or 2 to facet by.}

  \item{tot}{The turn of talk variable (character string).
  May be \code{TRUE} (assumes "tot" is the variable name),
  \code{FALSE} (use row numbers), or a character string of
  the turn of talk column.}

  \item{ncol}{number of columns.
  \code{\link[qdap]{gantt_wrap}} uses
  \code{\link[ggplot2]{facet_wrap}} rather than
  \code{\link[ggplot2]{facet_grid}}.}

  \item{transform}{logical.  If \code{TRUE} the repeated
  facets will be transformed from stacked to side by side.}

  \item{ylab}{Optional y label.}

  \item{xlab}{Optional x label.}

  \item{bar.space}{The amount space between bars (ranging
  between 1 and 0).}

  \item{scale}{Should scales be fixed (\code{"fixed"}, the
  default), free (\code{"free"}), or free in one dimension
  (\code{"free_x"}, \code{"free_y"})}

  \item{space}{If \code{"fixed"}, the default, all panels
  have the same size. If \code{"free_y"} their height will
  be proportional to the length of the y scale; if
  \code{"free_x"} their width will be proportional to the
  length of the x scale; or if \code{"free"} both height
  and width will vary. This setting has no effect unless
  the appropriate scales also vary.}

  \item{plot}{logical.  If \code{TRUE} the plot will
  automatically plot. The user may wish to set to
  \code{FALSE} for use in knitr, sweave, etc. to add
  additional plot layers.}
}
\value{
Invisibly returns the ggplot2 object.
}
\description{
Uses a bar graph to visualize patterns in sentence length
and grouping variables by turn of talk.
}
\examples{
\dontrun{
dataframe <- sentSplit(DATA, "state")
tot_plot(dataframe, "state")
tot_plot(DATA, "state", tot=FALSE)
tot_plot(dataframe, "state", bar.space=.03)
tot_plot(dataframe, "state", "sex")
tot_plot(dataframe, "state", "person", tot = "sex")
tot_plot(mraja1, "dialogue", "fam.aff", tot=FALSE)
tot_plot(mraja1, "dialogue", "died", tot=FALSE)
tot_plot(mraja1, "dialogue", c("sex", "fam.aff"), tot=FALSE) +
    scale_fill_hue(l=40)
tot_plot(mraja1, "dialogue", c("sex", "fam.aff"), tot=FALSE)+
    scale_fill_brewer(palette="Spectral")
tot_plot(mraja1, "dialogue", c("sex", "fam.aff"), tot=FALSE)+
    scale_fill_brewer(palette="Set1")

## repeated measures
rajSPLIT2 <- do.call(rbind, lapply(split(rajSPLIT, rajSPLIT$act), head, 25))
tot_plot(rajSPLIT2, "dialogue", "fam.aff", facet.var = "act")

## add mean and +/- 2 sd
tot_plot(mraja1, "dialogue", grouping.var = c("sex", "fam.aff"), tot=FALSE)+
    scale_fill_brewer(palette="Set1") +
    geom_hline(aes(yintercept=mean(word.count))) +
    geom_hline(aes(yintercept=mean(word.count) + (2 *sd(word.count)))) +
    geom_hline(aes(yintercept=mean(word.count) + (3 *sd(word.count)))) +
    geom_text(parse=TRUE, hjust=0, vjust=0, family="serif", size = 4, aes(x = 2,
        y = mean(word.count) + 2, label = "bar(x)")) +
    geom_text(hjust=0, vjust=0, family="serif", size = 4, aes(x = 1,
        y = mean(word.count) + (2 *sd(word.count)) + 2, label = "+2 sd")) +
    geom_text(hjust=0, vjust=0, family="serif", size = 4, aes(x = 1,
        y = mean(word.count) + (3 *sd(word.count)) + 2, label = "+3 sd"))
}
}
\keyword{sentence,}
\keyword{split,}
\keyword{turn-of-talk}

