\name{termco}
\alias{term_match}
\alias{termco}
\alias{termco2mat}
\alias{termco_d}
\title{Search For and Count Terms}
\usage{
termco(text.var, grouping.var = NULL, match.list, short.term = TRUE,
  ignore.case = TRUE, elim.old = TRUE, percent = TRUE, digits = 2,
  apostrophe.remove = FALSE, char.keep = NULL, digit.remove = NULL,
  zero.replace = 0, ...)

termco_d(text.var, grouping.var = NULL, match.string, short.term = FALSE,
  ignore.case = TRUE, zero.replace = 0, percent = TRUE, digits = 2,
  apostrophe.remove = FALSE, char.keep = NULL, digit.remove = TRUE, ...)

term_match(text.var, terms, return.list = TRUE, apostrophe.remove = FALSE)

termco2mat(dataframe, drop.wc = TRUE, short.term = TRUE,
  rm.zerocol = FALSE, no.quote = TRUE, transform = TRUE,
  trim.terms = TRUE)
}
\arguments{
  \item{text.var}{The text variable.}

  \item{grouping.var}{The grouping variables.  Default
  \code{NULL} generates one word list for all text.  Also
  takes a single grouping variable or a list of 1 or more
  grouping variables.}

  \item{match.list}{A list of named character vectors.}

  \item{short.term}{logical.  If \code{TRUE} column names
  are trimmed versions of the match list, otherwise the
  terms are wrapped with 'term(phrase)'}

  \item{ignore.case}{logical.  If \code{TRUE} case is
  ignored.}

  \item{elim.old}{logical.  If \code{TRUE} eliminates the
  columns that are combined together by the named
  match.list.}

  \item{percent}{logical.  If \code{TRUE} output given as
  percent.  If \code{FALSE} the output is proportion.}

  \item{digits}{Integer; number of decimal places to round
  when printing.}

  \item{apostrophe.remove}{logical.  If \code{TRUE} removes
  apostrophes from the text before examining.}

  \item{char.keep}{A character vector of symbol character
  (i.e., punctuation) that strip should keep.  The default
  is to strip everything except apostrophes.
  \code{\link[qdap]{termco}} attempts to auto detect
  characters to keep based on the elements in
  \code{match.list}.}

  \item{digit.remove}{logical.  If \code{TRUE} strips
  digits from the text before counting.
  \code{\link[qdap]{termco}} attempts to auto detect if
  digits should be retained based on the elements in
  \code{match.list}.}

  \item{zero.replace}{Value to replace 0 values with.}

  \item{\ldots}{Other argument supplied to
  \code{\link[qdap]{strip}}.}

  \item{match.string}{A vector of terms to search for.
  When using inside of \code{term_match} the term(s) must
  be words or partial words but do not have to be when
  using \code{\link[qdap]{termco_d}} (i.e., they can be
  phrases, symbols etc.).}

  \item{terms}{The terms to search for in the
  \code{text.var}.  Similar to \code{match.list} but these
  terms must be words or partial words rather than multiple
  words and symbols.}

  \item{return.list}{logical.  If \code{TRUE} returns the
  output for multiple terms as a list by term rather than a
  vector.}

  \item{dataframe}{A termco (or termco_d) dataframe or
  object.}

  \item{drop.wc}{logical.  If \code{TRUE} the word count
  column will be dropped.}

  \item{rm.zerocol}{logical.  If \code{TRUE} any column
  containing all zeros will be removed from the matrix.}

  \item{no.quote}{logical.  If \code{TRUE} the matrix will
  be printed without quotes if it's character.}

  \item{transform}{logical.  If \code{TRUE} the matrix will
  be transformed.}

  \item{trim.terms}{logical.  If \code{TRUE} trims the
  column header/names to ensure there is not a problem with
  spacing when using in other R functions.}
}
\value{
\code{termco} & \code{termco_d} - both return a list, of
class "termco", of data frames and information regarding
word counts: \item{raw}{raw word counts by grouping
variable} \item{prop}{proportional word counts by grouping
variable; proportional to each individual's word use}
\item{rnp}{a character combination data frame of raw and
proportional} \item{zero_replace}{value to replace zeros
with; mostly internal use} \item{percent}{The value of
percent used for plotting purposes.} \item{digits}{integer
value of number of digits to display; mostly internal use}

\code{term_match} - returns a list or vector of possible
words that match term(s).

\code{termco2mat} - returns a matrix of term counts.
}
\description{
\code{termco} - Search a transcript by any number of
grouping variables for categories (themes) of grouped root
terms.  While there are other termco functions in the
termco family (e.g., \code{\link[qdap]{termco_d}})
\code{termco} is a more powerful and flexible wrapper
intended for general use.

\code{termco_d} - Search a transcript by any number of
grouping variables for root terms.

\code{term_match} - Search a transcript for words that
exactly match term(s).

\code{termco2mat} - Convert a termco dataframe to a matrix
for use with visualization functions (e.g.,
\code{\link[gplots]{heatmap.2}}).
}
\note{
The match.list/match.string is (optionally) case and
character sensitive.  Spacing is an important way to grab
specific words and requires careful thought.  Using "read"
will find the words "bread", "read" "reading", and "ready".
If you want to search for just the word "read" you'd supply
a vector of c(" read ", " reads", " reading", " reader").
To search for non character arguments (i.e., numbers and
symbols) additional arguments from strip must be passed.
}
\section{Warning}{
  Percentages are calculated as a ratio of counts of
  \code{match.list} elements to word counts.  Word counts
  do not contain symbols or digits.  Using symbols, digits
  or small segments of full words (e.g., "to") could total
  more than 100\%.
}
\examples{
\dontrun{
#termco examples:

term <- c("the ", "she", " wh")
(out <- with(raj.act.1,  termco(dialogue, person, term)))

plot(out)
scores(out)
plot(scores(out))
counts(out)
plot(counts(out))
proportions(out)
plot(proportions(out))

# General form for match.list as themes
#
# ml <- list(
#     cat1 = c(),
#     cat2 = c(),
#     catn = c()
# )

ml <- list(
    cat1 = c(" the ", " a ", " an "),
    cat2 = c(" I'" ),
    "good",
    the = c("the", " the ", " the", "the")
)

(dat <- with(raj.act.1,  termco(dialogue, person, ml)))
scores(dat)  #useful for presenting in tables
counts(dat)  #prop and raw counts are useful for performing calculations
proportions(dat)
datb <- with(raj.act.1, termco(dialogue, person, ml,
    short.term = FALSE, elim.old=FALSE))
ltruncdf(datb, 20, 6)

(dat2 <- data.frame(dialogue=c("@bryan is bryan good @br",
    "indeed", "@ brian"), person=qcv(A, B, A)))

ml2 <- list(wrds=c("bryan", "indeed"), "@", bryan=c("bryan", "@ br", "@br"))

with(dat2, termco(dialogue, person, match.list=ml2))

with(dat2, termco(dialogue, person, match.list=ml2, percent = FALSE))

DATA$state[1] <- "12 4 rgfr  r0ffrg0"
termco(DATA$state, DATA$person, '0', digit.remove=FALSE)
DATA <- qdap::DATA

#Using with term_match and exclude
exclude(term_match(DATA$state, qcv(th), FALSE), "truth")
termco(DATA$state, DATA$person, exclude(term_match(DATA$state, qcv(th),
    FALSE), "truth"))
MTCH.LST <- exclude(term_match(DATA$state, qcv(th, i)), qcv(truth, stinks))
termco(DATA$state, DATA$person, MTCH.LST)

syns <- synonyms("doubt")
syns[1]
termco(DATA$state, DATA$person, unlist(syns[1]))
synonyms("doubt", FALSE)
termco(DATA$state, DATA$person, list(doubt = synonyms("doubt", FALSE)))
termco(DATA$state, DATA$person, syns)

#termco_d examples:
termco_d(DATA$state, DATA$person, c(" the", " i'"))
termco_d(DATA$state, DATA$person, c(" the", " i'"), ignore.case=FALSE)
termco_d(DATA$state, DATA$person, c(" the ", " i'"))

# termco2mat example:
MTCH.LST <- exclude(term_match(DATA$state, qcv(a, i)), qcv(is, it, am, shall))
termco_obj <- termco(DATA$state, DATA$person, MTCH.LST)
termco2mat(termco_obj)
plot(termco_obj)
plot(termco_obj, label = TRUE)
plot(termco_obj, label = TRUE, text.color = "red")
plot(termco_obj, label = TRUE, text.color="red", lab.digits=3)
}
}
\seealso{
\code{\link[qdap]{termco_c}},
\code{\link[qdap]{colcomb2class}}
}
\keyword{word-search}

