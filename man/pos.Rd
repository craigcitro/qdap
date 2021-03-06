\name{pos}
\alias{pos}
\alias{pos_by}
\alias{pos_tags}
\title{Parts of Speech Tagging}
\usage{
pos(text.var, parallel = FALSE, cores = detectCores()/2,
  progress.bar = TRUE, na.omit = FALSE, digits = 1, percent = TRUE,
  zero.replace = 0, gc.rate = 10)

pos_by(text.var, grouping.var = NULL, digits = 1, percent = TRUE,
  zero.replace = 0, ...)

pos_tags(type = "pretty")
}
\arguments{
  \item{text.var}{The text variable.}

  \item{parallel}{logical.  If \code{TRUE} attempts to run
  the function on multiple cores.  Note that this may not
  mean a speed boost if you have one core or if the data
  set is smaller as the cluster takes time to create.}

  \item{cores}{The number of cores to use if \code{parallel
  = TRUE}.  Default is half the number of available cores.}

  \item{na.omit}{logical.  If \code{TRUE} missing values
  (\code{NA}) will be omitted.}

  \item{progress.bar}{logical.  If \code{TRUE} attempts to
  provide a OS appropriate progress bar.  If parallel is
  \code{TRUE} this argument is ignored. Note that setting
  this argument to \code{TRUE} may slow down the function.}

  \item{digits}{Integer; number of decimal places to round
  when printing.}

  \item{percent}{logical.  If \code{TRUE} output given as
  percent.  If \code{FALSE} the output is proportion.}

  \item{zero.replace}{Value to replace 0 values with.}

  \item{gc.rate}{An integer value.  This is a necessary
  argument because of a problem with the garbage collection
  in the openNLP function that \code{\link[qdap]{pos}}
  wraps.  Consider adjusting this argument upward if the
  error \code{java.lang.OutOfMemoryError} occurs.}

  \item{grouping.var}{The grouping variables.  Default
  \code{NULL} generates one word list for all text.  Also
  takes a single grouping variable or a list of 1 or more
  grouping variables.}

  \item{\ldots}{Other argument supplied to \code{pos}.}

  \item{type}{An optional character string giving the
  output of the pos tags. This must be one of the strings
  \code{"pretty"} (a left justified version of the output
  optimized for viewing but not good for export),
  \code{"matrix"} (a matrix version of the output),
  \code{"dataframe"}\\ \code{"df"} (a dataframe version of
  the output), \code{"all"} (a list of all three of the
  previous output types).}
}
\value{
\code{pos} - returns a list of 4: \item{text}{The original
text} \item{POStagged}{The original words replaced with
parts of speech in context.} \item{POSprop}{Dataframe of
the proportion of parts of speech by row.}
\item{POSfreq}{Dataframe of the frequency of parts of
speech by row.} \item{POSrnp}{Dataframe of the frequency
and proportions of parts of speech by row.}
\item{percent}{The value of percent used for plotting
purposes.} \item{zero.replace}{The value of zero.replace
used for plotting purposes.}

\code{pos_by} - returns a list of 6: \item{text}{The
original text} \item{POStagged}{The original words replaced
with parts of speech in context.} \item{POSprop}{Dataframe
of the proportion of parts of speech by row.}
\item{POSfreq}{Dataframe of the frequency of parts of
speech by row.} \item{POSrnp}{Dataframe of the frequency
and proportions of parts of speech by row.}
\item{pos.by.prop}{Dataframe of the proportion of parts of
speech by grouping variable.} \item{pos.by.freq}{Dataframe
of the frequency of parts of speech by grouping variable.}
\item{pos.by.rnp}{Dataframe of the frequency and
proportions of parts of speech by grouping variable.}
\item{percent}{The value of percent used for plotting
purposes.} \item{zero.replace}{The value of zero.replace
used for plotting purposes.}
}
\description{
\code{pos} - Apply part of speech tagger to transcript(s).

\code{pos_by} - Apply part of speech tagger to
transcript(s) by zero or more grouping variable(s).

\code{pos_tags} - Useful for interpreting the parts of
speech tags created by pos and pos_by.
}
\examples{
\dontrun{
posdat <- pos(DATA$state)
ltruncdf(posdat, 7, 4)
## str(posdat)
names(posdat)
posdat$text           #original text

## Methods
preprocessed(posdat)  #words replaced with parts of speech
counts(posdat)        #frequency of parts of speech by row
proportions(posdat)   #proportion of parts of speech by row

## Methods Plotting
plot(preprocessed(posdat))
plot(counts(posdat))
plot(proportions(posdat))
plot(posdat)

out1 <- pos(DATA$state, parallel = TRUE) # not always useful
ltruncdf(out1, 7, 4)

#use pos_tags to interpret part of speech tags used by pos & pos_by
pos_tags()[1:10, ]
pos_tags("matrix")[1:10, ]
pos_tags("dataframe")[1:10, ]
pos_tags("df")[1:10, ]
ltruncdf(pos_tags("all"), 3)

posbydat <- with(DATA, pos_by(state, sex))
names(posbydat)

## Methods
scores(posbydat)
preprocessed(posbydat)
counts(posbydat)
proportions(posbydat)

## Methods Plotting
plot(preprocessed(posbydat))
plot(counts(posbydat))
plot(proportions(posbydat))
plot(posbydat)

ltruncdf(posbydat, 7, 4)
truncdf(posbydat$pos.by.prop, 4)

POSby <- with(DATA, pos_by(state, list(adult, sex)))
plot(POSby, values = TRUE, digits = 2)
#or more quickly - reuse the output from before
out2 <- with(DATA, pos_by(posbydat, list(adult, sex)))
}
}
\references{
\href{openNLP}{http:/opennlp.apache.org}
}
\seealso{
\code{\link[openNLP]{Maxent_POS_Tag_Annotator}},
\code{\link[qdap]{colcomb2class}}
}
\keyword{parts-of-speech}

