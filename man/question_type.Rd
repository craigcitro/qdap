\name{question_type}
\alias{question_type}
\title{Count of Question Type}
\usage{
question_type(text.var, grouping.var = NULL, neg.cont = FALSE,
  percent = TRUE, zero.replace = 0, digits = 2,
  contraction = qdapDictionaries::contractions, bracket = "all",
  amplifiers = qdapDictionaries::amplification.words, ...)
}
\arguments{
  \item{text.var}{The text variable}

  \item{grouping.var}{The grouping variables.  Default
  \code{NULL} generates one word list for all text.  Also
  takes a single grouping variable or a list of 1 or more
  grouping variables.}

  \item{neg.cont}{logical.  If \code{TRUE} provides
  separate counts for the negative contraction forms of the
  interrogative words.}

  \item{percent}{logical.  If \code{TRUE} output given as
  percent.  If \code{FALSE} the output is proportion.}

  \item{zero.replace}{Value to replace 0 values with.}

  \item{digits}{Integer; number of decimal places to round
  when printing.}

  \item{contraction}{A two column key of contractions
  (column 1) and expanded form replacements (column 2) or a
  vector of contractions.  Default is to use
  qdapDictionaries's
  \code{\link[qdapDictionaries]{contractions}} data set.}

  \item{bracket}{The type of bracket (and encased text) to
  remove.  This is one or more of the strings
  \code{"curly"}, \code{"square"}, \code{"round"},
  \code{"angle"} and \code{"all"}.  These strings
  correspond to: \{, [, (, < or all four types.}

  \item{amplifiers}{A character vector of terms that
  increase the intensity of a positive or negative word.
  Default is to use qdapDictionaries's
  \code{\link[qdapDictionaries]{amplification.words}} data
  set.}

  \item{\ldots}{Other arguments passed to
  \code{\link[qdap]{bracketX}}.}
}
\value{
Returns a list of: \item{raw}{A dataframe of the questions
used in the transcript and their type.} \item{count}{A
dataframe of total questions (\code{tot.quest}) and counts
of question types (initial interrogative word) by grouping
variable(s).} \item{rnp}{Dataframe of the frequency and
proportions of question types by grouping variable.}
\item{inds}{The indices of the original text variable that
contain questions.} \item{missing}{The row numbers of the
missing data (excluded from analysis).} \item{percent}{The
value of percent used for plotting purposes.}
\item{zero.replace}{The value of zero.replace used for
plotting purposes.}
}
\description{
Transcript apply question counts.
}
\details{
The algorithm searches for the following interrogative
words (and optionally, their negative contraction form as
well):

1) whose 2) whom 3) who 4) where 5) what 6) which 7) why 8)
when 9) were* 10) was* 11) does* 12) did* 13) do* 14) is
15) are* 16) will* 17) how 18) should 19) could 20) would*
21) shall 22) may 23) might* 24) must* 25) can* 26) has 27)
have* 28) had* 29) ok 30) right 31) correct 32) implied
do/does/did

The interrogative word that is found first (with the
exception of "ok", "right"/"alright", and "correct") in the
question determines the sentence type. "ok",
"right"/"alright", and "correct" sentence types are
determined if the sentence is a question with no other
interrogative words found and "ok", "right"/"alright", or
"correct" is the last word of the sentence.  Those
interrogative sentences beginning with the word "you",
"wanna", or "want" are categorized as implying do/does/did
question type, though the use of do/does/did is not
explicit.  Those sentence beginning with "you" followed by
a select interrogative word (and or their negative counter
parts) above (marked with *) or 1-2 amplifier(s) followed
by the select interrogative word are categorized by the
select word rather than an implied do/does/did question
type.  A sentence that is marked "ok" over rides an implied
do/does/did label.  Those with undetermined sentence type
are labeled unknown.
}
\examples{
\dontrun{
## Inspect the algorithm classification
x <- c("Kate's got no appetite doesn't she?",
    "Wanna tell Daddy what you did today?",
    "You helped getting out a book?", "umm hum?",
    "Do you know what it is?", "What do you want?",
    "Who's there?", "Whose?", "Why do you want it?",
    "Want some?", "Where did it go?", "Was it fun?")

left_just(preprocessed(question_type(x))[, c(2, 6)])

## Transcript/dialogue examples
(x <- question_type(DATA.SPLIT$state, DATA.SPLIT$person))

## methods
scores(x)
plot(scores(x))
counts(x)
plot(counts(x))
proportions(x)
plot(proportions(x))
truncdf(preprocessed(x), 15)
plot(preprocessed(x))

plot(x)
plot(x, label = TRUE)
plot(x, label = TRUE, text.color = "red")
question_type(DATA.SPLIT$state, DATA.SPLIT$person, percent = FALSE)
DATA[8, 4] <- "Won't I distrust you?"
question_type(DATA.SPLIT$state, DATA.SPLIT$person)
DATA <- qdap::DATA
with(DATA.SPLIT, question_type(state, list(sex, adult)))

out1 <- with(mraja1spl, question_type(dialogue, person))
## out1
out2 <- with(mraja1spl, question_type(dialogue, list(sex, fam.aff)))
## out2
out3 <- with(mraja1spl, question_type(dialogue, list(sex, fam.aff),
   percent = FALSE))
plot(out3, label = TRUE, lab.digits = 3)
}
}
\seealso{
\code{\link[qdap]{colcomb2class}},
\code{\link[qdap]{bracketX}}
}
\keyword{question,}
\keyword{question-count}

