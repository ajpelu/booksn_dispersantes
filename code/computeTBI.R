#' @title Compute Temporal Betadiversity Index
#' @description Compute Temporal Beta-diversity Index for a temporal series of a
#' dataframe.
#' @param data the data frame
#' @param vector.years the years for what the Temporal Betadiversity Index is
#' computed.
#' @param y0 the initial year for compare with the rest of years
#' @return \itemize{A dataframe with the following columns:
#' \item \code{year_t0, year_t1} the years for what the TBI were computed.
#' \item \code{mean(B/den)} scaled species losses
#' \item \code{mean(C/den)} scalec species gains
#' \item \code{mean(D)} disssimilarity
#' \item \code{B/(B+C)}
#' \item \code{C/(B+C)}
#' }
#'
#' @details See \code{TBI} from \package{adespatial}
#'
#' According to Legrende (2019): the scaled B and C statistics can be called
#' Dloss and Dgain, where Dloss = B/den and Dgain = C/den. An interesting
#' relationship is that Dloss + Dgain = D. In other words, Dloss and Dgain
#' partition the D dissimilarities into loss and gain components. Values of
#' these indices are in the [0,1] range and are thus directly comparable.
#' What are the ecological applications of Dloss and Dgain? For each site, one
#' can explore which process, between Dloss and Dgain, shows the largest
#' contribution to the temporal D dissimilarity; in other words, which process
#' is dominant at each site. The means of the Dloss and Dgain components across
#' the sites express the dynamics of the community over all sites.
#'
#' @seealso
#'  \code{\link[dplyr]{select}}
#' @rdname computeTBI
#' @export
#' @importFrom dplyr select
#'

computeTBI <- function(data, vector.years, y0=NULL, ...) {

  tbi.out <- data.frame()

  for (i in 1:length(vector.years)) {

    if (!exists("y0")) {
      y0 <- vector.years[i]}
     y1 <- vector.years[i + 1]
    habitat <- data %>% dplyr::select(habitat) %>%
      pull(habitat) %>%
      unique()

    if (is.na(y0) | is.na(y1)) {
      break
    }

    t0 <- data %>%
      filter(year == y0) %>%
      dplyr::select(-year, -habitat)
    t1 <- data %>%
      filter(year == y1) %>%
      dplyr::select(-year, -habitat)

    tbi <- TBI(t0, t1, method = "%diff", nperm = 0, test.t.perm = FALSE, BCD=TRUE)

    out <- cbind(
      habitat = habitat,
      year_t0 = y0,
      year_t1 = y1,
      tbi$BCD.summary
    )

    tbi.out <- rbind(tbi.out, out)
  }
  return(tbi.out)
}
