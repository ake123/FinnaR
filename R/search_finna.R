#' Search Finna Index with Extended Options
#' @name search_finna
#' @param lookfor Search terms. May include boolean operators.
#' @param type Search type (e.g., "AllFields", "Title", "Author", "Subject"). Defaults to "AllFields".
#' @param fields A vector of fields to return. Defaults to NULL, which returns all default fields.
#' @param filters A vector of filter queries. Defaults to NULL.
#' @param sort Sort method. Defaults to "relevance,id asc".
#' @param page The page number to retrieve. Defaults to 1.
#' @param limit The number of records to return per page. Defaults to 20.
#' @param lng Language for returned translated strings. Defaults to "fi".
#' @param prettyPrint Logical; whether to pretty-print the response. Defaults to FALSE.
#' @return A list containing the search results.
#' @examples
#' search_results <- search_finna("sibelius")
#' print(search_results)
#' @export
search_finna <- function(lookfor, type = "AllFields", fields = NULL, filters = NULL, facets = NULL, facetFilters = NULL, sort = "relevance,id asc", page = 1, limit = 100, lng = "fi", prettyPrint = FALSE) {

  # Return NULL if lookfor is empty
  if (lookfor == "" || is.null(lookfor)) {
    warning("search showed error: Empty search query provided.")
    return(NULL)
  }
  # Define the base URL for the search API
  base_url <- "https://api.finna.fi/v1/search"

  # Set the query parameters with the provided search options
  query_params <- list(
    lookfor = lookfor,
    type = type,
    `field[]` = fields,
    `filter[]` = filters,
    `facet[]` = facets,
    `facetFilter[]` = facetFilters,
    sort = sort,
    page = page,
    limit = limit,
    lng = lng,
    prettyPrint = prettyPrint
  )

  # Make the GET request
  response <- tryCatch(
    GET(base_url, query = query_params),
    error = function(e) {
      warning("search showed error: Failed to make the request.")
      return(NULL)
    }
  )

  # Check the response status
  if (status_code(response) == 200) {
    # Parse the content of the response
    search_results <- content(response, "parsed")

    # Extract the records
    records <- search_results$records

    # Extract relevant data from each record
    data <- lapply(records, function(record) {
      list(
        Title = if (!is.null(record$title)) record$title else NA,
        Author = if (!is.null(record$nonPresenterAuthors) && length(record$nonPresenterAuthors) > 0) {
          paste(sapply(record$nonPresenterAuthors, function(author) author$name), collapse = ", ")
        } else {
          NA
        },
        Year = if (!is.null(record$year)) record$year else NA,
        Language = if (!is.null(record$languages) && length(record$languages) > 0) record$languages[[1]] else NA,
        Formats = if (!is.null(record$formats) && length(record$formats) > 0) {
          paste(sapply(record$formats, function(format) format$translated), collapse = ", ")
        } else {
          NA
        },
        Subjects = if (!is.null(record$subjects) && length(record$subjects) > 0) {
          paste(sapply(record$subjects, function(subject) paste(subject, collapse = ", ")), collapse = "; ")
        } else {
          NA
        },
        Library = if (!is.null(record$buildings) && length(record$buildings) > 0) {
          paste(sapply(record$buildings, function(building) building$translated), collapse = ", ")
        } else {
          NA
        },
        Series = if (!is.null(record$series) && length(record$series) > 0) {
          paste(sapply(record$series, function(series) series$name), collapse = ", ")
        } else {
          NA
        }
      )
    })

    # Convert the list of lists into a tibble, unlisting elements where necessary
    tibble_results <- tibble::as_tibble(do.call(rbind, lapply(data, function(x) unlist(x, recursive = FALSE))))

    # Add language attribute to tibble
    attr(tibble_results, "language") <- lng

    return(tibble_results)

  } else {
    # Handle errors with detailed information
    error_message <- paste("Failed to perform the search. Status code:", status_code(response),
                           "- Response:", content(response, "text"))
    warning(error_message)
    return(NULL)
  }
}

