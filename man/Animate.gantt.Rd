\name{Animate.gantt}
\alias{Animate.gantt}
\title{Gantt Durations}
\usage{
\method{Animate}{gantt}(x, wc.time = TRUE, time.constant = 2,
  colors = NULL, ...)
}
\arguments{
  \item{x}{The gantt object.}

  \item{wc.time}{logical.  If \code{TRUE} weights duration
  of frame by word count.}

  \item{time.constant}{A constant to divide the maximum
  word count by.  Time is calculated by `round(exp(WORD
  COUNT/(max(WORD COUNT)/time.constant)))`. Therefore a
  larger constant will make the difference between the
  large and small word counts greater.}

  \item{colors}{An optional character vector of colors to
  color the Gantt bars. Must be length 1 (repeats the same
  color) or equal to the levels of the grouping variable.}

  \item{\ldots}{Other arguments passed to
  \code{\link[qdap]{gantt_wrap}}.}
}
\description{
\code{gantt} - Animate discourse from
\code{\link[qdap]{gantt}}.
}
\details{
gantt Method for Animate
}

