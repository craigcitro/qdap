#' Searches Text Column for Words
#' 
#' A convenience function to find words that begin with or contain a letter 
#' chunk and returns the frequency counts of the number of occurrences of each 
#' word.
#' 
#' @param text.var The text variable.
#' @param begins.with This argument takes a word chunk.  Default is \code{NULL}. 
#' Use this if searching for a word beginning with the word chunk.
#' @param contains This argument takes a word chunk.  Default is \code{NULL}. 
#' Use this if searching for a word containing the word chunk.
#' @param alphabetical logical.  If \code{TRUE} orders rows alphabetically, if 
#' \code{FALSE} orders the rows by descending frequency.
#' @param apostrophe.remove logical.  If \code{TRUE} removes apostrophes from 
#' the text before examining.
#' @param \ldots Other argument supplied to \code{\link[qdap]{strip}}.
#' @return Returns a dataframe with frequency counts of words that begin with or 
#' contain the provided word chunk.
#' @note Cannot provide both \code{begins.with} and \code{contains} arguments 
#' at once.  If both begins.with and contains are \code{NULL}.
#' \code{\link[qdap]{all_words}} returns a 
#' frequency count for all words.
#' @seealso 
#' \code{\link[qdap]{term_match}}
#' @export
#' @examples
#' \dontrun{
#' x1 <- all_words(raj$dialogue, begins.with="re")
#' head(x1, 10)
#' x2 <- all_words(raj$dialogue, "q")
#' head(x2, 10)
#' all_words(raj$dialogue, contains="conc")
#' x3 <- all_words(raj$dialogue)
#' head(x3, 10)
#' }
all_words <- 
function(text.var, begins.with = NULL, contains = NULL, alphabetical = TRUE, apostrophe.remove = FALSE, ...){
    if (!is.null(begins.with) & !is.null(contains)) {
        stop("Can not use both 'begins.with' & 'contains' arguments")
    }
    if(!is.null(begins.with)) begins.with <- tolower(begins.with)
    if(!is.null(contains)) contains <- tolower(contains)
    WORDS <- unlist(bag_o_words(strip(text.var, apostrophe.remove = apostrophe.remove, ...)))
    names(WORDS) <- NULL
    y <- data.frame(table(WORDS), stringsAsFactors = FALSE, row.names=NULL)
    names(y) <- c("WORD", "FREQ")
    y$WORD <- as.character(y$WORD)
    y[, "FREQ"] <- as.numeric(as.character(y[, "FREQ"]))
    if (!is.null(begins.with)) {
        y <- y[substring(y[, 1], 1, nchar(begins.with)) %in% begins.with, ]
        if(nrow(y)==0) stop("No words match")
    }
    if (!is.null(contains)) {
        y <- y[grep(contains, y[, 1]), ]
        if(nrow(y)==0) stop("No words match")
    }
    if (!alphabetical) {
        y <- y[order(-y$FREQ, y$WORD), ]
    }
    p <- class(y)
    class(y) <- c("all_words", p)
    y
}

#' Prints an all_words Object
#' 
#' Prints an all_words object.
#' 
#' @param x The all_words object.
#' @param \ldots ignored
#' @method print all_words
#' @S3method print all_words
print.all_words <- function(x, ...) {
    class(x) <- "data.frame"
    print(left_just(x, "WORD"))
}

#' Filter
#' 
#' \code{Filter.all_words} - Filter words from a all_words 
#' that meet max/min word length criteria.
#' 
#' all_words Method for Filter
#' @rdname Filter
#' @export
#' @method Filter all_words
#' @return \code{Filter.all_words} - Returns a matrix of the class "all_words".
Filter.all_words <- function(x, min = 1, max = Inf, 
    count.apostrophe = TRUE, stopwords = NULL, ignore.case = TRUE, ...) {

    word_list_filter_helper(x, min = min, max = max, 
        count.apostrophe = count.apostrophe, stopwords = stopwords, 
        ignore.case = ignore.case, ...)
}




