wrap <- function (lon, lmin = -180) {
 (lon - lmin)%%360 + lmin
}

#' Plot the glod, a joke ( Geographer's Line of Death)
#'
#' Creates a map and plots the line where lat == lon, because no other places are as confusing.
#'
#'
#' @param x a projection to use, a string understood by PROJ itself
#' @param plot logical, will create a plot by default
#' @param n number of points to plot on the line
#'
#' @return the line of points, invisibly if `plot = TRUE``
#' @export
#'
#' @importFrom graphics lines
#' @examples
#' glod()
#' glod("+proj=laea +lon_0=147 +lat_0=-42")
glod <- function(x = "+proj=laea", plot   = TRUE, n = 361) {
    d <- cbind(seq(-180, 180, length.out = n), seq(-90, 90, length.out = n))

    op <- options(warn = -1)
    on.exit(options(op), add = TRUE)

    d <- reproj::reproj_xy(d, x, source = "OGC:CRS84")
    mp[,1] <- wrap(mp[,1])
    if (plot) {
        plot(reproj::reproj_xy(mp, x, source = "OGC:CRS84"), pch = ".", asp = 1, axes = FALSE, xlab = "", ylab = "")
        lines(d, col = "red", lwd = 3)
        return(invisible(d))
    }
    return(d)
}
