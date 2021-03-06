\name{formality}
\alias{formality}
\title{Formality Score}
\usage{
formality(text.var, grouping.var = NULL, order.by.formality = TRUE,
  digits = 2, ...)
}
\arguments{
  \item{text.var}{The text variable (or an object from
  \code{\link[qdap]{pos}}, \code{\link[qdap]{pos_by}} or
  \code{\link[qdap]{formality}}.  Passing the later three
  object will greatly reduce run time.}

  \item{grouping.var}{The grouping variables.  Default
  \code{NULL} generates one word list for all text.  Also
  takes a single grouping variable or a list of 1 or more
  grouping variables.}

  \item{order.by.formality}{logical.  If \code{TRUE} orders
  the results by formality score.}

  \item{digits}{The number of digits displayed.}

  \item{\ldots}{Other arguments passed to
  \code{\link[qdap]{pos_by}}.}
}
\value{
A list containing at the following components:
\item{text}{The text variable} \item{POStagged}{Raw part of
speech for every word of the text variable}
\item{POSprop}{Part of speech proportion for every word of
the text variable} \item{POSfreq}{Part of speech count for
every word of the text variable} \item{pos.by.freq}{The
part of speech count for every word of the text variable by
grouping variable(s)} \item{pos.by.prop}{The part of speech
proportion for every word of the text variable by grouping
variable(s)} \item{form.freq.by}{The nine broad part of
speech categories count for every word of the text variable
by grouping variable(s)} \item{form.prop.by}{The nine broad
part of speech categories proportion for every word of the
text variable by grouping variable(s)}
\item{formality}{Formality scores by grouping variable(s)}
\item{pos.reshaped}{An expanded formality scores output
(grouping, word.count, pos & form.class) by word}
}
\description{
Transcript apply formality score by grouping variable(s)
and optionally plot the breakdown of the model.
}
\details{
Heylighen & Dewaele(2002)'s formality score is calculated
as: \deqn{F = 50(\frac{n_{f}-n_{c}}{N} + 1)}

Where: \deqn{f = \left \{noun, \;adjective, \;preposition,
\;article\right \}} \deqn{c = \left \{pronoun, \;verb,
\;adverb, \;interjection\right \}} \deqn{N = \sum{(f \;+
\;c \;+ \;conjunctions)}}
}
\section{Warning}{
  Heylighen & Dewaele (2002) state, "At present, a sample
  would probably need to contain a few hundred words for
  the measure to be minimally reliable. For single
  sentences, the F-value should only be computed for
  purposes of illustration" (p. 24).
}
\examples{
\dontrun{
with(DATA, formality(state, person))
(x1 <- with(DATA, formality(state, list(sex, adult))))
plot(x1)
plot(x1, short.names = FALSE)

scores(x1)
counts(x1)
proportions(x1)
preprocessed(x1)

plot(scores(x1))
plot(counts(x1))
plot(proportions(x1), high="darkgreen")
plot(preprocessed(x1))

data(rajPOS) #A data set consisting of a pos list object
x2 <- with(raj, formality(rajPOS, act))
plot(x2)
x3 <- with(raj, formality(rajPOS, person))
plot(x3, bar.colors="Dark2")
plot(x3, bar.colors=c("Dark2", "Set1"))
x4 <- with(raj, formality(rajPOS, list(person, act)))
plot(x4, bar.colors=c("Dark2", "Set1"))

rajDEM <- key_merge(raj, raj.demographics) #merge demographics with transcript.
x5 <- with(rajDEM, formality(rajPOS, sex))
plot(x5, bar.colors="RdBu")
x6 <- with(rajDEM, formality(rajPOS, list(fam.aff, sex)))
plot(x6, bar.colors="RdBu")
x7 <- with(rajDEM, formality(rajPOS, list(died, fam.aff)))
plot(x7, bar.colors="RdBu",  point.cex=2, point.pch = 3)
x8 <- with(rajDEM, formality(rajPOS, list(died, sex)))
plot(x8, bar.colors="RdBu",  point.cex=2, point.pch = "|")

names(x8)
colsplit2df(x8$formality)

#pass an object from pos or pos_by
ltruncdf(with(raj, formality(x8 , list(act, person))), 6, 4)

#=============#
## ANIMATION ##
#=============#
## EXAMPLE 1
form_ani <- formality(DATA.SPLIT$state, DATA.SPLIT$person)
forma <- Animate(form_ani, contextual="white", formal="blue",
    current.color = "yellow", current.speaker.color="grey70")

bgb <- vertex_apply(forma, label.color="grey80", size=20, color="grey40")
bgb <- edge_apply(bgb, label.color="yellow")

print(bgb, bg="black", net.legend.color ="white", pause=1)

## EXAMPLE 2
form_ani2 <- formality(raj.act.1POS, mraja1spl$person)
forma2 <- Animate(form_ani2, contextual="white", formal="blue",
    current.color = "yellow", current.speaker.color="grey70")

bgb2 <- vertex_apply(forma2, label.color="grey80", size=17, color="grey40")
bgb2 <- edge_apply(bgb2, label.color="yellow")
print(bgb2, bg="black", pause=.75, net.legend.color = "white")

## EXAMPLE 3 (bar plot)
Animate(form_ani2, as.network=FALSE)

#=====================#
## Complex Animation ##
#=====================#
library(animation)
library(grid)
library(gridBase)
library(qdap)
library(reports)
library(igraph)
library(plotrix)

form_ani2 <- formality(raj.act.1POS, mraja1spl$person)

## Set up the network version
form_net <- Animate(form_ani2, contextual="white", formal="blue",
    current.color = "yellow", current.speaker.color="grey70")
bgb <- vertex_apply(form_net, label.color="grey80", size=17, color="grey40")
bgb <- edge_apply(bgb, label.color="yellow")


## Set up the bar version
form_bar <- Animate(form_ani2, as.network=FALSE)

## Generate a folder
loc <- folder(animation_formality)

## Set up the plotting function
oopt <- animation::ani.options(interval = 0.1)


FUN <- function(follow=FALSE, theseq = seq_along(bgb)) {

    Title <- "Animated Formality: Romeo and Juliet Act 1"
    Legend <- c(.2, -1, 1.5, -.95)
    Legend.cex <- 1

    lapply(theseq, function(i) {
        if (follow) {
            png(file=sprintf("\%s/images/Rplot\%s.png", loc, i),
                width=650, height=725)
        }
        ## Set up the layout
        layout(matrix(c(rep(1, 9), rep(2, 4)), 13, 1, byrow = TRUE))

        ## Plot 1
        par(mar=c(2, 0, 2, 0), bg="black")
        #par(mar=c(2, 0, 2, 0))
        set.seed(22)
        plot.igraph(bgb[[i]], edge.curved=TRUE)
        mtext(Title, side=3, col="white")
        color.legend(Legend[1], Legend[2], Legend[3], Legend[4],
              c("Contextual", "Formal"), attributes(bgb)[["legend"]],
              cex = Legend.cex, col="white")

        ## Plot2
        plot.new()
        vps <- baseViewports()

        uns <- unit(c(-1.3,.5,-.75,.25), "cm")
        p <- form_bar[[i]] +
            theme(plot.margin = uns,
                text=element_text(color="white"),
                legend.text=element_text(color="white"),
                legend.background = element_rect(fill = "black"),
                plot.background = element_rect(fill = "black",
                    color="black"))
        print(p,vp = vpStack(vps$figure,vps$plot))
        animation::ani.pause()

        if (follow) {
            dev.off()
        }
    })

}

FUN()

## Detect OS
type <- if(.Platform$OS.type == "windows") shell else system

saveHTML(FUN(, 1:20), autoplay = FALSE, loop = TRUE, verbose = FALSE,
    ani.height = 1000, ani.width=650,
    outdir = loc, single.opts =
    "'controls': ['first', 'play', 'loop', 'speed'], 'delayMin': 0")

FUN(TRUE)
}
}
\references{
Heylighen, F., & Dewaele, J.M. (2002). Variation in the
contextuality of language: An empirical measure. Context in
Context, Special issue of Foundations of Science, 7 (3),
293-340.
}
\keyword{explicit,}
\keyword{formality,}
\keyword{parts-of-speech,}
\keyword{pos}

