\name{mcsv_r}
\alias{mcsv_r}
\alias{mcsv_w}
\title{Read/Write Multiple csv Files at a Time}
\usage{
mcsv_r(files, a.names = NULL, l.name = NULL, list = TRUE, pos = 1,
  envir = as.environment(pos))

mcsv_w(..., dir = NULL, open = FALSE, sep = ", ", dataframes = NULL,
  pos = 1, envir = as.environment(pos))
}
\arguments{
  \item{files}{csv file(s) to read.}

  \item{a.names}{object names to assign the csv file(s) to.
  If \code{NULL} assigns the name(s) of the csv files in
  the directory, without the file extension, to the objects
  in the global environment.}

  \item{l.name}{A single character string of a name to
  assign to the list if dataframes created by the csv files
  being read in.  Default (\code{NULL}) uses \code{L1}.}

  \item{list}{logical.  If \code{TRUE} then a list of
  dataframes is crated in the global environment in
  addition to the individual dataframes.}

  \item{pos}{where to do the removal. By default, uses the
  current environment.}

  \item{envir}{the environment to use.}

  \item{\dots}{data.frame object(s) to write to a file or a
  list of data.frame objects.  If the objects in a list are
  unnamed V + digit will be assigned. Lists of dataframes
  (e.g., the output from \code{\link[qdap]{termco}} or
  \code{\link[qdap]{polarity}}) can be passed as well.}

  \item{dir}{optional directory names.  If \code{NULL} a
  directory will be created in the working directory with
  the data and time stamp as the folder name.}

  \item{open}{logical.  If \code{TRUE} opens the directory
  upon completion.}

  \item{sep}{A character string to separate the terms.}

  \item{dataframes}{An optional character vector of
  dataframes in lieu of \dots argument.}
}
\value{
\code{mcsv_r} - reads in multiple csv files at once.

\code{mcsv_w} - creates a directory with multiple csv
files. Silently returns the path of the directory.
}
\description{
\code{mcsv_r} - Read and assign multiple csv files at the
same time.

\code{mcsv_w} - Write multiple csv files into a file at the
same time.
}
\details{
mcsv is short for "multiple csv" and the suffix c(_r, _w)
stands for "read" (r) or "write" (w).
}
\note{
\code{\link[qdap]{mcsv_r}} is useful for reading in
multiple csv files from \code{\link[qdap]{cm_df.temp}} for
interaction with \code{\link[qdap]{cm_range2long}}.
}
\examples{
\dontrun{
## mcsv_r EXAMPLE:
mtcarsb <- mtcars[1:5, ]; CO2b <- CO2[1:5, ]
(a <- mcsv_w(mtcarsb, CO2b, dir="foo"))
rm("mtcarsb", "CO2b")  # gone from .GlobalEnv
(nms <- dir(a))
mcsv_r(file.path(a, nms))
mtcarsb; CO2b
rm("mtcarsb", "CO2b")  # gone from .GlobalEnv
mcsv_r(file.path(a, nms), paste0("foo.dat", 1:2))
foo.dat1; foo.dat2
rm("foo.dat1", "foo.dat2")  # gone from .GlobalEnv
library(reports); delete("foo")

## mcsv_w EXAMPLES:
(a <- mcsv_w(mtcars, CO2, dir="foo"))
delete("foo")

## Write lists of dataframes as well
poldat <- with(DATA.SPLIT, polarity(state, person))
term <- c("the ", "she", " wh")
termdat <- with(raj.act.1,  termco(dialogue, person, term))
mcsv_w(poldat, termdat, mtcars, CO2, dir="foo2")
delete("foo2")
}
}
\seealso{
\code{\link[qdap]{cm_range2long}},
\code{\link[qdap]{cm_df.temp}},
\code{\link[qdap]{condense}}, \code{\link[base]{assign}}
}

