% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/contributor.R
\name{job_contributor_bonus}
\alias{job_contributor_bonus}
\alias{job_contributor_notify}
\title{Contact Contributors}
\usage{
job_contributor_bonus(id, contributor, amount, ...)

job_contributor_notify(id, contributor, msg, ...)
}
\arguments{
\item{id}{A character string containing an ID for job to be updated.}

\item{contributor}{A character string containing a contributor/contributor ID.}

\item{amount}{A character string containing a bonus amount in U.S. cents.}

\item{...}{Additional arguments passed to \code{\link{cf_query}}.}

\item{msg}{A character string containing a message to be sent to the contributor.}
}
\value{
A character string containing the job ID, invisibly.
}
\description{
Contact a contributor via email or pay a contributor a bonus in U.S. cents
}
\examples{
\dontrun{
# Send message
job_contributor_notify(j, w, "Great work!")

# Pay bonus
job_contributor_bonus(j, w, "0.01")
}
}
\seealso{
\code{\link{job_create}}
}
\keyword{contributors}

