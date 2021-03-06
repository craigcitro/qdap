\name{list2df}
\alias{list2df}
\alias{list_df2df}
\alias{list_vect2df}
\alias{matrix2df}
\alias{vect2df}
\title{List/Matrix/Vector to Dataframe}
\usage{
list2df(list.object, col1 = "X1", col2 = "X2")

matrix2df(matrix.object, col1 = "var1")

vect2df(vector.object, col1 = "X1", col2 = "X2", order = TRUE,
  rev = FALSE)

list_df2df(list.df.object, col1 = "X1")

list_vect2df(list.vector.object, col1 = "X1", col2 = "X2", col3 = "X3",
  ...)
}
\arguments{
  \item{list.object}{A named \code{\link[base]{list}} of
  vectors..}

  \item{col1}{Name for column 1 (the vector elements if
  converting a list or the rownames if converting a
  matrix).}

  \item{col2}{Name for column 2 (the names of the
  vectors).}

  \item{matrix.object}{A matrix or simple_triplet_matrix
  object.}

  \item{vector.object}{A vector object.}

  \item{order}{logical.  If \code{TRUE} the dataframe will
  be ordered.}

  \item{rev}{logical. If \code{TRUE} and \code{order =
  TRUE} the dataframe will be ordered in descending order.}

  \item{list.df.object}{A list of dataframes with equal
  number/named of columns.}

  \item{list.vector.object}{A list of dataframes with equal
  number/named of columns.}

  \item{col3}{The name of the third column
  (\code{list_vect2df}).}

  \item{\dots}{Further arguments passed to \code{vect2df})}
}
\value{
\code{list2df} - Returns a dataframe with two columns.

\code{matrix2df} - Returns a dataframe.

\code{vect2df} - Returns a dataframe.

\code{list_df2df} - Returns a dataframe.

\code{list_vect2df} - Returns a dataframe.
}
\description{
\code{list2df} - Convert a named list of vectors to a
dataframe.

\code{matrix2df} - Convert a matrix to a dataframe and
convert the rownames to the first column.

\code{vect2df} - Convert a named vector to a dataframe.

\code{list_df2df} - Convert a list of equal numbered/named
columns to a dataframe using the list names as the level
two variable.

\code{list_vect2df} - Convert a list of named vectors to a
hierarchical dataframe.
}
\details{
generally an internal function used for reshaping data.
}
\examples{
lst1 <- list(x=c("foo", "bar"), y=1:5)
list2df(lst1)

lst2 <- list(a=qcv(hello, everybody), b = mtcars[1:6, 1])
list2df(lst2, "col 1", "col 2")

matrix2df(mtcars)
matrix2df(cor(mtcars))
matrix2df(matrix(1:9, ncol=3))

vect2df(1:10)
vect2df(c(table(mtcars[, "gear"])))

list_df2df(list(mtcars, mtcars))

L1 <- list(a=1:10, b=1:6, c=5:8)
list_vect2df(L1)
}
\keyword{collapse}
\keyword{list}

