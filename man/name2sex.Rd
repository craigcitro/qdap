\name{name2sex}
\alias{name2sex}
\title{Names to Gender Prediction}
\usage{
name2sex(names.list, pred.sex = TRUE, fuzzy.match = pred.sex,
  USE.NAMES = FALSE, database = NAMES_SEX, list.database = NAMES_LIST)
}
\arguments{
  \item{names.list}{Character vector containing first
  names.}

  \item{pred.sex}{logical.  If \code{TRUE} overlapping M/F
  names will be predicted based on highest cumulative
  frequency.  If \code{FALSE} the overlapping names will be
  denoted with a \code{"B"}.}

  \item{fuzzy.match}{logical.  If \code{TRUE} uses
  Levenshtein edit distance from \code{\link[base]{agrep}}
  to predict gender from the closest name match starting
  with the same letter.  This is computationally intensive
  and should not be used on larger vectors.  Defaults to
  \code{pred.sex}.}

  \item{USE.NAMES}{logical.  If \code{TRUE} names.list is
  used to name the gender vector.}

  \item{database}{A database of names (mostly for internal
  purposes).}

  \item{list.database}{A list version of the database of
  names broken down by first letter of the name (mostly for
  internal purposes).}
}
\value{
Returns a vector of predicted gender (M/F) based on first
name.
}
\description{
Predict gender from U.S. names (based on 1990 U.S. census
data).
}
\examples{
\dontrun{
name2sex(qcv(mary, jenn, linda, JAME, GABRIEL, OLIVA,
    tyler, jamie, JAMES, tyrone, cheryl, drew))

name2sex(qcv(mary, jenn, linda, JAME, GABRIEL, OLIVA,
    tyler, jamie, JAMES, tyrone, cheryl, drew), FALSE)

name2sex(qcv(mary, jenn, linda, JAME, GABRIEL, OLIVA,
    tyler, jamie, JAMES, tyrone, cheryl, drew), FALSE, TRUE)

name2sex(qcv(mary, jenn, linda, JAME, GABRIEL, OLIVA,
    tyler, jamie, JAMES, tyrone, cheryl, drew), TRUE, FALSE)

## Get rank percent frequency ratio of being a gender
library(qdapDictionaries)

orig_nms <- qcv(mary, jenn, linda, JAME, GABRIEL, OLIVA,
    tyler, jamie, JAMES, tyrone, cheryl, drew)

sex <- name2sex(orig_nms, FALSE, TRUE)

names(sex) <- rep("", length(sex))
names(sex)[sex == "B"] <- sapply(toupper(orig_nms[sex == "B"]), function(x) {
        y <- NAMES[NAMES[, 1] \%in\% x, ]
        round(log(Reduce("/", y[ order(y[, "gender"]), "per.freq"])), 2)
    })

## The log ratio of being a female name
sex
orig_nms
data.frame(name = orig_nms, sex = sex, `ratio_F:M` = names(sex),
    check.names=FALSE)
}
}
\author{
Dason Kurkiewicz and Tyler Rinker <tyler.rinker@gmail.com>.
}
\references{
\url{http://www.census.gov/genealogy/www/data/1990surnames/names_files.html}

\url{http://stackoverflow.com/a/818231/1000343}

\url{http://www.talkstats.com/showthread.php/31660}
}
\seealso{
\code{\link[base]{agrep}}
}
\keyword{gender}
\keyword{name}

