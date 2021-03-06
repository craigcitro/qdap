\name{strWrap}
\alias{strWrap}
\title{Wrap Character Strings to Format Paragraphs}
\usage{
strWrap(text = "clipboard", width = 70, copy2clip = interactive())
}
\arguments{
  \item{text}{character vector, or an object which can be
  converted to a character vector by
  \code{\link[base]{as.character}}.}

  \item{width}{A positive integer giving the target column
  for wrapping lines in the output.}

  \item{copy2clip}{logical.  If \code{TRUE} attempts to
  copy the output to the clipboard.}
}
\value{
Prints a wrapped text vector to the console and copies the
wrapped text to the clipboard on a Mac or Windows machine.
}
\description{
A wrapper for \code{\link[base]{as.character}} that writes
to the Mac/Windows clipboard.
}
\examples{
\dontrun{
x <- paste2(DATA$state, sep = " " )
strWrap(x)
strWrap(x, 10)
#should be copied to the clipboard on a Mac or Windows machine.
}
}
\seealso{
\code{\link[base]{strwrap}}
}
\keyword{string-wrap}

