\name{Animate.polarity}
\alias{Animate.polarity}
\title{Animate Polarity}
\usage{
\method{Animate}{polarity}(x, negative = "blue", positive = "red",
  neutral = "yellow", edge.constant, wc.time = TRUE, time.constant = 2,
  title = NULL, digits = 3, current.color = "black",
  current.speaker.color = NULL, non.speaker.color = NA,
  ave.color.line = "red", as.network = TRUE, ...)
}
\arguments{
  \item{x}{A \code{\link[qdap]{polarity}} object.}

  \item{negative}{The color to use for negative polarity.}

  \item{positive}{The color to use for positive polarity.}

  \item{neutral}{The color to use for neutral polarity.}

  \item{edge.constant}{A constant to multiple edge width
  by.}

  \item{wc.time}{logical.  If \code{TRUE} weights duration
  of frame by word count.}

  \item{time.constant}{A constant to divide the maximum
  word count by.  Time is calculated by `round(exp(WORD
  COUNT/(max(WORD COUNT)/time.constant)))`. Therefore a
  larger constant will make the difference between the
  large and small word counts greater.}

  \item{title}{The title to apply to the animated
  image(s).}

  \item{digits}{The number of digits to use in the current
  turn of talk polarity.}

  \item{current.color}{The color to use for the current
  turn of talk polarity.}

  \item{current.speaker.color}{The color for the current
  speaker.}

  \item{non.speaker.color}{The color for the speakers not
  currently speaking.}

  \item{ave.color.line}{The color to use for the average
  color line if \code{network = FALSE}.}

  \item{as.network}{logical.  If \code{TRUE} the animation
  is a network plot. If \code{FALSE} the animation is a
  hybrid dot plot.}

  \item{\ldots}{Other arguments passed to
  \code{\link[qdap]{discourse_map}}.}
}
\description{
\code{Animate.polarity} - Animate a
\code{\link[qdap]{polarity}} object.
}
\details{
polarity Method for Animate
}
\note{
The width of edges is based on words counts on that edge
until that moment divided by total number of words used
until that moment.  Thicker edges tend to thin as time
passes.  The actual duration the current edge stays as the
\code{current.color} is based on word counts for that
particular flow of dialogue divided by total dialogue
(words) used.  The edge label is the current polarity for
that turn of talk (an aggregation of the sub sentences of
the current turn of talk).  The coloring of the current
edge polarity is produced at th sentence level, therefor a
label may indicate a positive current turn of talk, while
the coloring may indicate a negative sentences.
}

