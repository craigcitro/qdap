\name{cm_df.fill}
\alias{cm_df.fill}
\title{Range Coding}
\usage{
cm_df.fill(dataframe, ranges, value = 1, text.var = NULL,
  code.vars = NULL, transform = FALSE)
}
\arguments{
  \item{dataframe}{A dataframe containing a text variable.}

  \item{ranges}{A named list of ranges to recode.  Names
  correspond to code names in dataframe.}

  \item{value}{The recode value.  Takes a vector of length
  one or a vector of length equal to the number of code
  columns.}

  \item{text.var}{The name of the text variable.}

  \item{code.vars}{Optional vector of codes.}

  \item{transform}{logical.  If \code{TRUE} the words are
  located across the top of dataframe.}
}
\value{
Generates a dummy coded dataframe.
}
\description{
Allows range coding of words for efficient coding.
}
\details{
After ranging coding transcripts via
(\code{\link{cm_df.temp}}) or the blank code matrix via
(\code{\link{cm_df.transcript}}),\code{cm_df.fill} is used
to create a matrix of what codes occurred at what words (a
filled code matrix).  A list of range codes (word number
spans) is fed to \code{cm_df.fill}.  A single number
indicates a single word with that coding scheme whereas the
colon is used as a separator that indicates the range of
words from x to y are that particular code.
}
\examples{
\dontrun{
codes <- qcv(dc, sf, wes, pol, rejk, lk, azx, mmm)
X <- cm_df.temp(DATA, "state", codes)
head(X, 10)

#recommended structure
cds1 <- list(
     dc=c(1:3, 5),
     sf=c(4, 6:9, 11),
     wes=0,
     pol=0,
     rejk=0,
     lk=0,
     azx=1:30,
     mmm=5
)

out1 <- cm_df.fill(X, cds1)
head(out1)

#recommended structure
cds2 <- list(
    sf=c(4, 6:9, 11),
    dc=c(1:3, 5),
    azx=1:30,
    mmm=5
)
out2 <- cm_df.fill(X, cds2)
head(out2)
}
}
\references{
Miles, M. B. & Huberman, A. M. (1994). An expanded
sourcebook: Qualitative data analysis. 2nd ed. Thousand
Oaks, CA: SAGE Publications.
}
\seealso{
\code{\link{cm_df.temp}}, \code{\link{cm_df.transcript}},
\code{\link{cm_df2long}}
}
\keyword{coding}

