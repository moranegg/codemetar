
#' @importFrom utils installed.packages
get_root_path <- function(pkg){
  installed <- installed.packages()
  if(pkg %in% installed[,1]){
    root <- base::system.file(".", package = pkg)
  } else if(file.exists(file.path(pkg, "DESCRIPTION"))){
    root <- pkg
  } else {
    #warning("no package root not found") ## don't warn if input is codemeta list or a DESCRIPTION, since we know these haven't got a root
    if(is.character(pkg)){
      root <- pkg # use pkg as guess anyway
    } else {
      root <- "." # stick with default
    }
  }
  root
}


## based on devtools::read_dcf
read_dcf <- function(dcf) {

  fields <- colnames(read.dcf(dcf))
  as.list(read.dcf(dcf, keep.white = fields)[1, ])

}

## Like system.file, but pkg can instead be path to package root directory
get_file <- function(FILE, pkg = "."){
  f <- file.path(pkg, FILE)
  if(file.exists(f))
    f
  else {
    f <- system.file(FILE, package = pkg)
  }
}






is_IRI <- function(string){
  ## FIXME IRI can be many other things too, see https://github.com/dgerber/rfc3987 for more formal implementation
  grepl("^http[s]?://", string)
}

