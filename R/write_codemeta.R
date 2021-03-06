#' write_codemeta
#' @param pkg package path to package root, or package name, or description file (character), or a codemeta object (list)
#' @param path file name of the output, leave at default "codemeta.json"
#' @param root if pkg is a codemeta object, optionally give the path to package root. Default guess is current dir.
#' @param id identifier for the package, e.g. a DOI (or other resolvable URL)
#' @param ...  additional arguments to \code{\link{write_json}}
#' @details If pkg is a codemeta object, the function will attempt to
#'  update any fields it can guess (i.e. from the DESRIPTION file),
#'  overwriting any existing data in that block. In this case, the package
#'  root directory should be the current working directory.
#' @return writes out the codemeta.json file
#' @export
#'
#' @importFrom jsonlite write_json
#' @examples
#' write_codemeta("codemeta")
write_codemeta <- function(pkg = ".",
                           path = "codemeta.json",
                           root = ".",
                           id = NULL,
                           ...) {


  cm <- create_codemeta(pkg = pkg, root = root)
  jsonlite::write_json(cm, path, pretty=TRUE, auto_unbox = TRUE, ...)

}

