\name{gantt_plot}
\alias{gantt_plot}
\title{Gantt Plot}
\usage{
gantt_plot(text.var, grouping.var = NULL, rm.var = NULL, fill.var = NULL,
  xlab = "duration (in words)", units = "words", col.sep = "__", ...)
}
\arguments{
  \item{text.var}{The text variable.}

  \item{grouping.var}{The grouping variables. Also takes a
  single grouping variable or a list of 1 or more grouping
  variables.}

  \item{rm.var}{An optional single vector or list of 1 or 2
  of repeated measures to facet by}

  \item{fill.var}{An optional variable to fill the code
  strips by.}

  \item{xlab}{The name of the x-axis label.}

  \item{units}{The unit of measurement.}

  \item{col.sep}{The column separator.}

  \item{\ldots}{Other arguments passed to
  \code{\link[qdap]{gantt_wrap}}.}
}
\value{
Returns a Gantt style visualization.  Invisibly returns the
ggplot2 list object.
}
\description{
A convenience function that wraps
\code{\link[qdap]{gantt}}, \code{\link[qdap]{gantt_rep}}
and \code{\link[qdap]{gantt_wrap}} into a single plotting
function.
}
\note{
For non-repeated measures data/plotting use
\code{\link[qdap]{gantt}}; for repeated measures data
output use \code{\link[qdap]{gantt_rep}}; and for a
flexible gantt plot that words with code matrix functions
(cm) use \code{\link[qdap]{gantt_wrap}}.
}
\examples{
\dontrun{
with(rajSPLIT, gantt_plot(text.var = dialogue,
    grouping.var = person, size=4))

with(rajSPLIT, gantt_plot(text.var = dialogue,
    grouping.var = list(fam.aff, sex), rm.var  = act,
    title = "Romeo and Juliet's dialogue"))

with(rajSPLIT, gantt_plot(dialogue, list(fam.aff, sex), act,
    transform=T))

rajSPLIT2 <- rajSPLIT

rajSPLIT2$newb <- as.factor(sample(LETTERS[1:2], nrow(rajSPLIT2),
    replace=TRUE))

z <- with(rajSPLIT2, gantt_plot(dialogue, list(fam.aff, sex),
    list(act, newb), size = 4))

library(ggplot2); library(scales); library(RColorBrewer); library(grid)
z + theme(panel.margin = unit(1, "lines")) + scale_colour_grey()
z + scale_colour_brewer(palette="Dark2")

## Fill Variable Example
dat <- rajSPLIT[rajSPLIT$act == 1, ]
dat$end_mark <- factor(end_mark(dat$dialogue))

with(dat, gantt_plot(text.var = dialogue, grouping.var = list(person, sex),
    fill.var=end_mark))

## Repeated Measures with Fill Example
rajSPLIT$end_mark <- end_mark(rajSPLIT$dialogue)

with(rajSPLIT, gantt_plot(text.var = dialogue,
    grouping.var = list(fam.aff), rm.var  = list(act),
    fill.var=end_mark, title = "Romeo and Juliet's dialogue"))

## Repeated Measures Sentence Type Example
with(rajSPLIT, gantt_plot(text.var = dialogue,
    grouping.var = list(fam.aff, sex), rm.var  = list(end_mark, act),
    title = "Romeo and Juliet's dialogue"))

## Reset rajSPLIT
rajSPLIT <- qdap::rajSPLIT

## Animate It
##=================
ani_gantt <- with(mraja1, gantt_plot(dialogue, person))

library(animation)
loc <- folder(animation_gantt)

## Set up the plotting function
oopt <- animation::ani.options(interval = 0.1)

FUN <- function() {
    out <- Animate(ani_gantt)
    lapply(out, function(x) {
        print(x)
        animation::ani.pause()
    })

}

type <- if(.Platform$OS.type == "windows") shell else system
saveVideo(FUN(), video.name = "animation.avi", interval = 0.1, outdir = loc)

saveLatex(FUN(), autoplay = TRUE, loop = FALSE, latex.filename = "tester.tex",
    caption = "animated dialogue", outdir = loc, ani.type = "pdf",
    ani.dev = "pdf", ani.width = 5, ani.height = 5.5, interval = 0.1)


saveHTML(FUN(), autoplay = FALSE, loop = TRUE, verbose = FALSE,
    ani.width=600, ani.height=280,
    outdir = file.path(loc, "new"), single.opts =
    "'controls': ['first', 'play', 'loop', 'speed'], 'delayMin': 0")

}
}
\references{
Clark, W. & Gantt, H. (1922) The Gantt chart, a working
tool of management. New York, Ronald Press.
}
\seealso{
\code{\link[qdap]{gantt}}, \code{\link[qdap]{gantt_rep}},
\code{\link[qdap]{gantt_wrap}}
}
\keyword{Gantt}

