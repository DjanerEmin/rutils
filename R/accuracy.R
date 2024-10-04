#' Prediction accuracy
#'
#'  Calculates user, producer, overall, and kappa from an error matrix.
#' NB! Reference (truth) must be along the columns of the matrix
#' (e.g. second argument in \code{raster::crosstab}, or \code{base::table} )
#'
#' @param table contingency table produced from \code{terra::crosstab}, or
#' \code{base::table}
#'
#' @return list with names \code{augm, userproducer, overall, kappa}
#' @export
#' @examples
#' a<- terra::rast(system.file("ex/logo.tif", package="terra"))
#' # make everything above 50 to be 50 and everything below NA
#' res<- r_reclassify_threshold(a, 50, c(1, 50))
#' res_table<- terra::crosstab(c(res[[1]], res[[2]]))
#' res_table
#' accuracy(res_table)

accuracy <- function(table){

    kappa <- function(m) {
        N <- sum(m)
        No <- sum(diag(m))
        Ne <- 1 / N * sum(colSums(m) * rowSums(m))
        return( (No - Ne) / (N - Ne) )
    }

    user <- diag(table) / rowSums(table)
    producer <- diag(table) / colSums(table)
    overall <- sum(diag(table)) / sum(table) * 100


    augm <- addmargins(table)
    augm <- rbind(augm, "UA" = c(producer, NA))
    augm <- cbind(augm, "PA" = c(user, NA, overall))
    augm <- round(augm, 2)
    dimnames(augm) <- list("Prediction" = colnames(augm),
                           "Reference" = rownames(augm))
    class(augm) <- "table"


    out <- list(augm = augm,
                userproducer = round(cbind(user, producer), 2),
                overall = overall,
                kappa = kappa(table))

    return(out)
}
