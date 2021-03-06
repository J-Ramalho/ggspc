#' Summary statistics table outputs for Statistical Process Control
#' 
#' @description
#' This function takes summary statistics and presents them in a easy readable 
#' table format.
#'
#' @references 
#' For a complete case study application refer to \url{https://j-ramalho.github.io/industRial/}
#
#' @param data 
#' A data set generated by the function \code{\link{process_stats}}
#'
#' @return
#' This function returns an object with classes gt_tbl and list
#' @export
#' @importFrom rlang .data
process_stats_table <- function(data) {
  stats_data <- data %>%
    dplyr::group_by(.data$weight_target_value) %>%
    dplyr::summarise(
      weight_mean = mean(.data$weight_value) %>% round(2),
      spec_min = mean(.data$spec_min) %>% round(2),
      spec_max = mean(.data$spec_max) %>% round(2),
      weight_out_perc = mean(.data$weight_out_perc) %>% round(2),
      capability_index = mean(.data$Cpk),
      part_count = dplyr::n()
    )
  short_data <- stats_data %>%
    dplyr::select(
      .data$weight_mean, .data$weight_target_value, .data$spec_min, 
      .data$spec_max, .data$weight_out_perc, 
      .data$capability_index, .data$part_count) %>%
    tidyr::pivot_longer(cols = tidyr::everything(),
                        names_to = "variable",
                        values_to = "Value")
  table_data <- short_data %>%
    dplyr::mutate(Variable = dplyr::case_when(
      variable == "weight_mean" ~ "Weight mean",
      variable == "weight_target_value" ~ "Spec target",
      variable == "spec_min" ~ "Spec min",
      variable == "spec_max" ~ "Spec max",
      variable == "weight_out_perc" ~ "Out of spec",
      variable == "capability_index" ~ "Cpk",
      variable == "part_count" ~ "Sample size",
      TRUE ~ variable
    ))
  table_data %>%
    dplyr::mutate(Unit = dplyr::case_when(
      variable == "weight_mean" ~ "g",
      variable == "weight_target_value" ~ "g",
      variable == "spec_min" ~ "g",
      variable == "spec_max" ~ "g",
      variable == "weight_out_perc" ~ "%",
      variable == "capability_index" ~ "",
      variable == "part_count" ~ "parts",
      TRUE ~ variable
    )) %>%
    dplyr::select(.data$Variable, .data$Value, .data$Unit) %>%
    gt::gt() %>%
    gt::tab_style(style = list(gt::cell_text(weight = "bold")), 
              locations = gt::cells_body(rows = c(5, 6))) %>%
    gt::fmt_number(columns = 2, rows = .data$Variable == "Sample size", decimals = 0) %>%
    gt::tab_header(title = "Process Summary Statistics")
}