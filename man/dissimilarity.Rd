\name{Dissimilarity}
\alias{Dissimilarity}
\alias{dissimilarity}
\title{Dissimilarity Statistics}
\usage{
Dissimilarity(text.var, grouping.var = NULL, method = "prop",
  diag = FALSE, upper = FALSE, p = 2, ...)

dissimilarity(text.var, grouping.var = NULL, method = "prop",
  diag = FALSE, upper = FALSE, p = 2, ...)
}
\arguments{
  \item{text.var}{A text variable or word frequency matrix
  object.}

  \item{grouping.var}{The grouping variables.  Default
  \code{NULL} generates one word list for all text.  Also
  takes a single grouping variable or a list of 1 or more
  grouping variables.}

  \item{method}{Distance methods (see
  \code{\link[stats]{dist}} function). If \code{"prop"}
  (the default) the result is 1 - \code{"binary"}.}

  \item{diag}{logical.  If \code{TRUE} returns the
  diagonals of the matrix.  If \code{method = "prop"}
  diagonals will not be returned.}

  \item{upper}{logical.  If \code{TRUE} returns the upper
  triangle of the matrix.}

  \item{p}{The power of the Minkowski distance.}

  \item{\ldots}{Other arguments passed to
  \code{\link[qdap]{wfm}}.}
}
\value{
Returns a matrix of dissimilarity values (the agreement
between text).
}
\description{
Uses the distance function to calculate dissimilarity
statistics by grouping variables.
}
\examples{
\dontrun{
with(DATA, Dissimilarity(state, list(sex, adult)))
with(DATA, Dissimilarity(state, person, diag = TRUE))

## Clustering: Dendrogram
(x <- with(pres_debates2012, Dissimilarity(dialogue, list(person, time))))
fit <- hclust(x)
plot(fit)
## draw dendrogram with red borders around the 3 clusters
rect.hclust(fit, k=3, border=c("red", "purple", "seagreen"))

## Clustering: Dendrogram with p.values
library(pvclust)
wfm.mod <- with(pres_debates2012, wfm(dialogue, list(person, time)))
fit <- pvclust(wfm.mod, method.hclust="ward",
   method.dist="euclidean")
plot(fit)
pvrect(fit, alpha=.95)

## Mutidimentional Scaling
## Based on blog post from Bodong Chen
## http://bodongchen.com/blog/?p=301

## Fit it: 2-D
(diss <- with(pres_debates2012, Dissimilarity(dialogue, list(person, time),
    method = "euclidean")))
fit <- cmdscale(diss, eig = TRUE, k = 2)

## Plot it 2-D
points <- data.frame(x = fit$points[, 1], y = fit$points[, 2])
ggplot(points, aes(x = x, y = y)) +
    geom_point(data = points, aes(x = x, y = y, color = rownames(points))) +
    geom_text(data = points, aes(x = x, y = y - 0.2, label = row.names(points)))

## Fit it: 3-D
library(scatterplot3d)
fit <- cmdscale(diss, eig = TRUE, k = 3)

points <- data.frame(colSplit(names(fit$points[, 1])))
points$colors <- points$X1 \%l\% data.frame(levels(points$X1),
    qcv(yellow, yellow, blue, yellow, red, yellow))
points$shape <- points$X2 \%l\% data.frame(levels(points$X2), c(15, 17, 19))

## Plot it: 3-D
scatterplot3d(fit$points[, 1], fit$points[, 2], fit$points[, 3],
    color = points$colors, pch = points$shape,
    main = "Semantic Space Scaled to 3D", xlab = "x", ylab = "y",
    zlab = "z", type = "h")

legend("bottomright", title="Person",
   qcv(Obama, Romney, Other), fill=qcv(blue, red, yellow))
legend("topleft",  paste("Time", 1:3), pch=c(15, 17, 19))

## Compare to Cosine Similarity
cos_sim <- function(x, y) x \%*\% y / sqrt(x\%*\%x * y\%*\%y)
mat <- matrix(rbinom(500, 0:1, .45), ncol=10)
v_outer(mat, cos_sim)

v_outer(with(DATA, wfm(state, person)), cos_sim)
with(DATA, Dissimilarity(state, person))
}
}
\seealso{
\code{\link[stats]{dist}}
}
\keyword{dissimilarity}

