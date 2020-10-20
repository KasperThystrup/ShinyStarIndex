#' @importFrom utils download.file
#' @importFrom fs path_abs
#' @importFrom XML getHTMLLinks
download_fasta <- function(
  url = "ftp://ftp.ensembl.org/pub",
  release,
  species,
  build = "GRCh38",
  version = "primary_assembly",
  pkg = golem::get_golem_wd(),
  dir_create = TRUE
){
  
  old <- setwd(path_abs(pkg))  
  on.exit(setwd(old))
  
  ftp <- file.path(
    url,
    paste_("release", release, dash = TRUE),
    species,
    paste.(species, build, "dna", version)
  )
  
  if (url.exists(ftp))
    download.file(ftp)
}

