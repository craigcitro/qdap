\name{plot.word_proximity}
\alias{plot.word_proximity}
\title{Plots a word_proximity object}
\usage{
\method{plot}{word_proximity}(x, label = TRUE, lab.digits = NULL,
  high = "red", low = "white", grid = NULL, ...)
}
\arguments{
  \item{x}{The word_proximity object}

  \item{label}{logical.  If \code{TRUE} the cells of the
  heat map plot will be labeled with count and proportional
  values.}

  \item{lab.digits}{Integer values specifying the number of
  digits to be printed if \code{label} is \code{TRUE}.}

  \item{low}{The color to be used for lower values.}

  \item{high}{The color to be used for higher values.}

  \item{grid}{The color of the grid (Use \code{NULL} to
  remove the grid).}

  \item{\ldots}{Other arguments passed to qheat.}
}
\description{
Plots a word_proximity object.
}

