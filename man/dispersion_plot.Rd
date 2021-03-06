\name{dispersion_plot}
\alias{dispersion_plot}
\title{Lexical Dispersion Plot}
\usage{
dispersion_plot(text.var, match.terms, grouping.var = NULL, rm.vars = NULL,
  color = "blue", bg.color = "grey90", horiz.color = "grey85",
  total.color = "black", symbol = "|", title = "Lexical Dispersion Plot",
  rev.factor = TRUE, wrap = "'", xlab = "Dialogue (Words)", ylab = NULL,
  size = 4, plot = TRUE, char2space = "~~", apostrophe.remove = FALSE,
  scales = "free", space = "free", ...)
}
\arguments{
  \item{text.var}{The text variable.}

  \item{match.terms}{A vector of quoted terms.}

  \item{grouping.var}{The grouping variables.  Default
  \code{NULL} generates one word list for all text.  Also
  takes a single grouping variable or a list of 1 or more
  grouping variables.}

  \item{rm.vars}{The repeated measures variables.  Default
  \code{NULL} generates one facet for all text.  Also takes
  a single repeated measures variable or a list of 1 or
  more grouping variables.}

  \item{color}{The color of the word symbols.}

  \item{bg.color}{The background color.}

  \item{horiz.color}{The color of the horizontal tracking
  stripe.  Use \code{horiz.color = bg.color} to eliminate.}

  \item{total.color}{The color to use for summary `all`
  group.  If \code{NULL} totals are dropped.}

  \item{symbol}{The word symbol.  Default is \code{"|"}.}

  \item{title}{Title of the plot}

  \item{rev.factor}{logical.  If \code{TRUE} reverses the
  plot order of the factors.}

  \item{wrap}{a character to wrap around the words (enables
  the reader to visualize spaces).  Default is \code{"'"},
  use \code{""} to remove.}

  \item{xlab}{The x label.}

  \item{ylab}{The y label.}

  \item{size}{The size of the plotting symbol.}

  \item{plot}{logical.  If \code{TRUE} the plot will
  automatically plot. The user may wish to set to
  \code{FALSE} for use in knitr, sweave, etc. to add
  additional plot layers.}

  \item{char2space}{A vector of characters to be turned
  into spaces.}

  \item{apostrophe.remove}{logical.  If \code{TRUE} removes
  apostrophes from the output.}

  \item{scales}{Should scales be fixed (\code{"fixed"}, the
  default), free (\code{"free"}), or free in one dimension
  (\code{"free_x"}, \code{"free_y"})}

  \item{space}{If \code{"fixed"}, the default, all panels
  have the same size. If \code{"free_y"} their height will
  be proportional to the length of the y scale; if
  \code{"free_x"} their width will be proportional to the
  length of the x scale; or if \code{"free"} both height
  and width will vary.}

  \item{\ldots}{Other argument supplied to
  \code{\link[qdap]{strip}}.}
}
\value{
Plots a dispersion plot and invisibly returns the ggplot2
object.
}
\description{
Generate a lexical dispersion plot of terms.
}
\note{
The match.terms is character sensitive.  Spacing is an
important way to grab specific words and requires careful
thought.  Using "read" will find the words "bread", "read"
"reading", and "ready".  If you want to search for just the
word "read" you'd supply a vector of c(" read ", " reads",
" reading", " reader").
}
\examples{
\dontrun{
term_match(raj$dialogue, c(" love ", "love", " night ", "night"))
dispersion_plot(raj$dialogue, c(" love ", "love", " night ", "night"))
dispersion_plot(raj$dialogue, c("love", "night"), rm.vars = raj$act)
with(rajSPLIT , dispersion_plot(dialogue, c("love", "night"),
    grouping.var = list(fam.aff, sex), rm.vars = act))

## With grouping variables
with(rajSPLIT , dispersion_plot(dialogue, c("love", "night"),
     grouping.var = sex, rm.vars = act))

## Drop total with `total.color = NULL`
with(rajSPLIT , dispersion_plot(dialogue, c("love", "night"),
     grouping.var = sex, rm.vars = act, total.color = NULL))

## Change color scheme
with(rajSPLIT, dispersion_plot(dialogue, c("love", "night"),
    bg.color = "black", grouping.var = list(fam.aff, sex),
    color = "yellow", total.color = "white", horiz.color="grey20"))

## Use word list
## Presidential debates by all
wrds <- word_list(pres_debates2012$dialogue, stopwords = Top200Words)
wrds2 <- spaste(wrds[["rfswl"]][["all"]][, "WORD"])
wrds2 <- c(" governor~~romney ", wrds2[-c(3, 12)])
with(pres_debates2012 , dispersion_plot(dialogue, wrds2, rm.vars = time))

## Presidential debates by person
dat <- pres_debates2012
dat <- dat[dat$person \%in\% qcv(ROMNEY, OBAMA), ]

wordlist <- c(" tax", " health", " rich ", "america", " truth",
    " money", "cost", " governnor", " president", " we ",
    " job", " i ", " you ", " because ", " our ", " years ")

with(dat, dispersion_plot(dialogue, wordlist, total.color = NULL,
    bg.color = "white", grouping.var = person, rm.vars = time,
    color = "black", horiz.color="grey80"))

## Extras:
## Reverse facets

x <- with(pres_debates2012 , dispersion_plot(dialogue, wrds2, rm.vars = time))

## function to reverse ggplot2 facets
rev_facet <- function(x) {
    names(x$facet)[1:2] <- names(x$facet)[2:1]
    print(x)
}

rev_facet(x)
}
}
\seealso{
\code{\link[qdap]{term_match}}
}
\keyword{dispersion}

