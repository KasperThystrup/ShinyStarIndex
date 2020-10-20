paste. <- function(
  ...,
  collapse = NULL,
  recycle0 = FALSE
){
  
  string <- base::paste(..., sep = ".", collapse)
  
  substr(x = string, start = 1, stop = nchar(string) - 1)
}

paste_ <- function(
  ...,
  dash = FALSE,
  collapse = NULL,
  recycle0 = FALSE
){
  
  string <- base::paste(..., sep = "_", collapse)
  
  substr(x = string, start = 1, stop = nchar(string) - 1)
}

paste_n <- function(
  ...,
  collapse = NULL,
  recycle0 = FALSE
){
  string <- base::paste(..., sep = "\n", collapse)
  
  substr(x = string, start = 1, stop = nchar(string) - 1)
}

url.exists <- function(
  url,
  timeout = 2
){
  con <- base::url(url)
  
  on.exit(
    suppressWarnings(
      try(
        close.connection(con),
        silent=T
      )
    )
  )
  
  check <- suppressWarnings(
    try(
      open.connection(con,open="rt",timeout=t),
      silent=T
    )[1])

  ifelse(is.null(check),TRUE,FALSE)
}
