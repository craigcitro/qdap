\name{print.character_table}
\alias{print.character_table}
\title{Prints a character_table object}
\usage{
\method{print}{character_table}(x, digits = 2, percent = NULL,
  zero.replace = NULL, ...)
}
\arguments{
  \item{x}{The character_table object}

  \item{digits}{Integer values specifying the number of
  digits to be printed.}

  \item{percent}{logical.  If \code{TRUE} output given as
  percent.  If \code{FALSE} the output is proportion.  If
  \code{NULL} uses the value from
  \code{\link[qdap]{termco}}.  Only used if \code{label} is
  \code{TRUE}.}

  \item{zero.replace}{Value to replace 0 values with.  If
  \code{NULL} uses the value from
  \code{\link[qdap]{termco}}.  Only used if \code{label} is
  \code{TRUE}.}

  \item{\ldots}{ignored}
}
\description{
Prints a character_table object.
}

