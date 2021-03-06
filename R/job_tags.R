#' @rdname tags
#' @title Get and set job tags
#' @description Get, set, and replace the \dQuote{tags} for a job
#' @param id A character string containing an ID for job.
#' @param ... Additional arguments passed to \code{\link{cf_query}}.
#' @return For \code{job_tags_get}, a character vector of tags. Otherwise, a logical \code{TRUE}, or an error.
#' @examples 
#' \dontrun{
#' # create new job
#' f1 <- system.file("templates/instructions1.html", package = "crowdflower")
#' f2 <- system.file("templates/cml1.xml", package = "crowdflower")
#' j <- job_create(title = "Job Title", 
#'                instructions = readChar(f1, nchars = 1e8L),
#'                cml = readChar(f2, nchars = 1e8L))
#'
#' # get tags
#' job_tags_get(j)
#'
#' # add new tag
#' job_tags_add(j, "textanalysis")
#' 
#' # replace tags
#' job_tags_add(j, c("foo", "bar"))
#' job_tags_get(j)
#' }
#' @seealso \code{\link{job_create}}
#' @keywords tags
#' @export
job_tags_get <- function(id, ...){

    endpoint <- paste0('jobs/', id, '/tags')
    out <- cf_query(endpoint, type = "GET", ...)
    
    out2 <- unlist(lapply(out, `[[`, "name"))
    if (is.null(out2)) {
        return(character())
    }
    return(out2)

}

#' @rdname tags
#' @param tags For \code{job_tags_add}, a character vector specifying one or more tags to add. For \code{job_tags_replace}, the same but to \emph{replace} rather than \emph{add} the tags.
#' @param verbose A logical indicating whether to print additional information about the request.
#' @export
job_tags_add <- function(id, tags, verbose = TRUE, ...){

    endpoint <- paste0('jobs/', id, '/tags')
    out <- cf_query(endpoint, type = "POST", 
                   body = list(tags = paste(tags, collapse = ",")), 
                   encode = "multipart", ...)
    if (verbose) {
        message(out$success)
    }
    return(TRUE)

}

#' @rdname tags
#' @export
job_tags_replace <- function(id, tags, verbose = TRUE, ...){

    endpoint <- paste0('jobs/', id, '/tags')
    out <- cf_query(endpoint, type = "PUT", 
                   body = list(tags = paste(tags, collapse = ",")), 
                   encode = "multipart", ...)
    if (verbose) {
        message(out$success)
    }
    return(TRUE)

}
