\name{polarity}
\alias{polarity}
\alias{polarity_frame}
\title{Polarity Score (Sentiment Analysis)}
\usage{
polarity(text.var, grouping.var = NULL,
  polarity.frame = qdapDictionaries::env.pol,
  negators = qdapDictionaries::negation.words,
  amplifiers = qdapDictionaries::amplification.words,
  deamplifiers = qdapDictionaries::deamplification.words,
  question.weight = 0, amplifier.weight = 0.8, n.before = 4,
  n.after = 2, rm.incomplete = FALSE, digits = 3, ...)

polarity_frame(positives, negatives, pos.weights = 1, neg.weights = -1,
  envir = TRUE)
}
\arguments{
  \item{text.var}{The text variable.}

  \item{grouping.var}{The grouping variables.  Default
  \code{NULL} generates one word list for all text.  Also
  takes a single grouping variable or a list of 1 or more
  grouping variables.}

  \item{polarity.frame}{A dataframe or environment
  containing a dataframe of positive/negative words and
  weights.}

  \item{negators}{A character vector of terms reversing the
  intent of a positive or negative word.}

  \item{amplifiers}{A character vector of terms that
  increase the intensity of a positive or negative word.}

  \item{deamplifiers}{A character vector of terms that
  decrease the intensity of a positive or negative word.}

  \item{question.weight}{The weighting of questions (values
  from 0 to 1). Default 0 corresponds with the belief that
  questions (pure questions) are not polarized.  A weight
  may be applied based on the evidence that the questions
  function with polarity.}

  \item{amplifier.weight}{The weight to apply to
  amplifiers/deamplifiers (values from 0 to 1).  This value
  will multiply the polarized terms by 1 + this value.}

  \item{n.before}{The number of words to consider as
  valence shifters before the polarized word.}

  \item{n.after}{The number of words to consider as valence
  shifters after the polarized word.}

  \item{rm.incomplete}{logical.  If \code{TRUE} text rows
  ending with qdap's incomplete sentence end mark
  (\code{|}) will be removed from the analysis.}

  \item{digits}{Integer; number of decimal places to round
  when printing.}

  \item{\ldots}{Other arguments supplied to
  \code{\link[qdap]{strip}}.}

  \item{positives}{A character vector of positive words.}

  \item{negatives}{A character vector of negative words.}

  \item{pos.weights}{A vector of weights to weight each
  positive word by. Length must be equal to length of
  \code{postives} or length 1 (if 1 weight will be
  recycled).}

  \item{neg.weights}{A vector of weights to weight each
  negative word by. Length must be equal to length of
  \code{negatives} or length 1 (if 1 weight will be
  recycled).}

  \item{envir}{logical.  If \code{TRUE} a lookup table (a
  dataframe within an environment) is produced rather than
  a data.frame.}
}
\value{
Returns a list of: \item{all}{A dataframe of scores per row
with: \itemize{ \item group.var - the grouping variable
\item wc - word count \item polarity - sentence polarity
score \item pos.words - words considered positive \item
neg.words - words considered negative \item text.var - the
text variable} } \item{group}{A dataframe with the average
polarity score by grouping variable: \itemize{ \item
group.var - the grouping variable \item total.sentences -
Total sentences spoken.  \item total.words - Total words
used.  \item ave.polarity - The sum of all polarity scores
for that group divided by number of sentences spoken.
\item sd.polarity - The standard deviation of that group's
sentence level polarity scores.  \item stan.mean.polarity -
A standardized polarity score calculated by taking the
average polarity score for a group divided by the standard
deviation.} } \item{digits}{integer value od number of
digits to display; mostly internal use}
}
\description{
\code{polarity} - Approximate the sentiment (polarity) of
text by grouping variable(s).

\code{polarity_frame} - Generate a polarity lookup
environment or data.frame for use with the
\code{polarity.frame} argument in the \code{polarity}
function.
}
\details{
The equation used by the algorithm to assign value to
polarity of each sentence fist utilizes the sentiment
dictionary (Hu and Liu, 2004) to tag polarized words.  A
context cluster (\eqn{x_i^{T}}) of words is pulled from
around this polarized word (default 4 words before and two
words after) to be considered as valence shifters.  The
words in this context cluster are tagged as neutral
(\eqn{x_i^{0}}), negator (\eqn{x_i^{N}}), amplifier
(\eqn{x_i^{a}}), or de-amplifier (\eqn{x_i^{d}}). Neutral
words hold no value in the equation but do affect word
count (\eqn{n}).  Each polarized word is then weighted
\eqn{w} based on the weights from the \code{polarity.frame}
argument and then further weighted by the number and
position of the valence shifters directly surrounding the
positive or negative word.  The researcher may provide a
weight \eqn{c} to be utilized with amplifiers/de-amplifiers
(default is .8; deamplifier weight is constrained to -1
lower bound).  Last, these context cluster (\eqn{x_i^{T}})
are summed and divided by the square root of the word count
(\eqn{\sqrt{n}}) yielding an unbounded polarity score
(\eqn{\delta}).  Note that context clusters containing a
comma before the polarized word will only consider words
found after the comma.

\deqn{\delta=\frac{x_i^T}{\sqrt{n}}}

Where:

\deqn{x_i^T=\sum{((1 + c(x_i^{A} - x_i^{D}))\cdot
w(-1)^{\sum{x_i^{N}}})}}

\deqn{x_i^{A}=\sum{(w_{neg}\cdot x_i^{a})}}

\deqn{x_{i}^D=\left\{\begin{array}{cc} x_{i}^D & x_{i}^D
\geq -1 \\ -1 & x_{i}^D < -1 \end{array}\right.}

\deqn{x_i^{D}=\sum{(- w_{neg}\cdot x_i^{a} + x_i^{d})}}

\deqn{w_{neg}=\left\{\begin{array}{cc} 1 & \sum{x_i^{N}}
\bmod {2} >0 \\ 0 & \sum{x_i^{N}} \bmod {2} =0
\end{array}\right.}
}
\note{
The polarity score is dependent upon the polarity
dictionary used. This function defaults to the word
polarity dictionary used by Hu, M., & Liu, B. (2004),
however, this may not be appropriate for the context of
children in a classroom.  The user may (is encouraged) to
provide/augment the dictionary (see the
\code{polarity_frame} function).  For instance the word
"sick" in a high school setting may mean that something is
good, whereas "sick" used by a typical adult indicates
something is not right or negative connotation.

Also note that \code{\link[qdap]{polarity}} assumes you've
run \code{\link[qdap]{sentSplit}}.
}
\examples{
\dontrun{
with(DATA, polarity(state, list(sex, adult)))
(poldat <- with(sentSplit(DATA, 4), polarity(state, person)))
counts(poldat)
scores(poldat)
plot(poldat)

poldat2 <- with(mraja1spl, polarity(dialogue,
    list(sex, fam.aff, died)))
colsplit2df(scores(poldat2))
plot(poldat2)
plot(scores(poldat2))

poldat3 <- with(rajSPLIT, polarity(dialogue, person))
poldat3[["group"]][, "OL"] <- outlier_labeler(scores(poldat3)[,
    "ave.polarity"])
poldat3[["all"]][, "OL"] <- outlier_labeler(counts(poldat3)[,
    "polarity"])
htruncdf(scores(poldat3), 10)
htruncdf(counts(poldat3), 15, 8)
plot(poldat3)
plot(poldat3, nrow=4)
qheat(scores(poldat3)[, -7], high="red", order.b="ave.polarity")

## Create researcher defined polarity.frame
POLENV <- polarity_frame(positive.words, negative.words)
POLENV
ls(POLENV)[1:20]

## ANIMATION
#===========
(deb2 <- with(subset(pres_debates2012, time=="time 2"),
    polarity(dialogue, person)))

bg_black <- Animate(deb2, neutral="white", current.speaker.color="grey70")
print(bg_black, pause=.75)

bgb <- vertex_apply(bg_black, label.color="grey80", size=20, color="grey40")
bgb <- edge_apply(bgb, label.color="yellow")
print(bgb, bg="black", pause=.75)

## Save it
library(animation)
library(igraph)
library(plotrix)

loc <- folder(animation_polarity)

## Set up the plotting function
oopt <- animation::ani.options(interval = 0.1)

FUN <- function() {
    Title <- "Animated Polarity: 2012 Presidential Debate 2"
    Legend <- c(-1.1, -1.25, -.2, -1.2)
    Legend.cex <- 1
    lapply(seq_along(bgb), function(i) {
        par(mar=c(2, 0, 1, 0), bg="black")
        set.seed(10)
        plot.igraph(bgb[[i]], edge.curved=TRUE)
        mtext(Title, side=3, col="white")
        color.legend(Legend[1], Legend[2], Legend[3], Legend[4],
              c("Negative", "Neutral", "Positive"), attributes(bgb)[["legend"]],
              cex = Legend.cex, col="white")
        animation::ani.pause()
    })
}

FUN()

## Detect OS
type <- if(.Platform$OS.type == "windows") shell else system

saveHTML(FUN(), autoplay = FALSE, loop = TRUE, verbose = FALSE,
    ani.height = 500, ani.width=500,
    outdir = file.path(loc, "new"), single.opts =
    "'controls': ['first', 'play', 'loop', 'speed'], 'delayMin': 0")

## Detect OS
type <- if(.Platform$OS.type == "windows") shell else system

saveHTML(FUN2(), autoplay = FALSE, loop = TRUE, verbose = FALSE,
    ani.height = 1000, ani.width=650,
    outdir = loc2, single.opts =
    "'controls': ['first', 'play', 'loop', 'speed'], 'delayMin': 0")

FUN2(TRUE)

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

deb2dat <- subset(pres_debates2012, time=="time 2")
deb2dat[, "person"] <- factor(deb2dat[, "person"])
(deb2 <- with(deb2dat, polarity(dialogue, person)))

## Set up the network version
bg_black <- Animate(deb2, neutral="white", current.speaker.color="grey70")
bgb <- vertex_apply(bg_black, label.color="grey80", size=30, label.size=22,
    color="grey40")
bgb <- edge_apply(bgb, label.color="yellow")

## Set up the bar version
deb2_bar <- Animate(deb2, as.network=FALSE)

## Generate a folder
loc2 <- folder(animation_polarity2)

## Set up the plotting function
oopt <- animation::ani.options(interval = 0.1)


FUN2 <- function(follow=FALSE, theseq = seq_along(bgb)) {

    Title <- "Animated Polarity: 2012 Presidential Debate 2"
    Legend <- c(.2, -1.075, 1.5, -1.005)
    Legend.cex <- 1

    lapply(theseq, function(i) {
        if (follow) {
            png(file=sprintf("\%s/images/Rplot\%s.png", loc2, i),
                width=650, height=725)
        }
        ## Set up the layout
        layout(matrix(c(rep(1, 9), rep(2, 4)), 13, 1, byrow = TRUE))

        ## Plot 1
        par(mar=c(2, 0, 2, 0), bg="black")
        #par(mar=c(2, 0, 2, 0))
        set.seed(20)
        plot.igraph(bgb[[i]], edge.curved=TRUE)
        mtext(Title, side=3, col="white")
        color.legend(Legend[1], Legend[2], Legend[3], Legend[4],
              c("Negative", "Neutral", "Positive"), attributes(bgb)[["legend"]],
              cex = Legend.cex, col="white")

        ## Plot2
        plot.new()
        vps <- baseViewports()

        uns <- unit(c(-1.3,.5,-.75,.25), "cm")
        p <- deb2_bar[[i]] +
            theme(plot.margin = uns,
                text=element_text(color="white"),
                plot.background = element_rect(fill = "black",
                    color="black"))
        print(p,vp = vpStack(vps$figure,vps$plot))
        animation::ani.pause()

        if (follow) {
            dev.off()
        }
    })

}

FUN2()

## Detect OS
type <- if(.Platform$OS.type == "windows") shell else system

saveHTML(FUN2(), autoplay = FALSE, loop = TRUE, verbose = FALSE,
    ani.height = 1000, ani.width=650,
    outdir = loc2, single.opts =
    "'controls': ['first', 'play', 'loop', 'speed'], 'delayMin': 0")

FUN2(TRUE)
}
}
\references{
Hu, M., & Liu, B. (2004). Mining opinion features in
customer reviews. National Conference on Artificial
Intelligence.

\url{http://www.slideshare.net/jeffreybreen/r-by-example-mining-twitter-for}
}
\seealso{
\url{https://github.com/trestletech/Sermon-Sentiment-Analysis}
}
\keyword{polarity}
\keyword{sentiment,}

