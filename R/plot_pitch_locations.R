#' @title **Plot Pitch Locations**
#'
#' @description This function allows you to plot all pitch locations from the dataset
#' @param input_df The file you want to use to plot the pitch locations.
#' @importFrom ggplot2 ggplot geom_point geom_curve geom_segment coord_fixed theme stat_density2d xlim ylim scale_fill_continuous aes_string element_text scale_fill_manual aes
#' @export
#' @examples
#' plot_pitch_location()

plot_pitch_location <- function(input_df) {

  pitch_locations_plot <- input_df %>%
    ggplot() +
    geom_polygon(home_plate, mapping = aes(x/12, z/12), fill = "#ededed", color = "lightgrey") +
    geom_point(mapping = aes(x = PlateLocSide, y = PlateLocHeight,
                             fill = TaggedPitchType), shape = 21, size = 5, show.legend = F) +
    geom_path(sz, mapping = aes(x/12, z/12)) +
    theme_minimal() +
    scale_fill_manual(values = pitch_colors) +
    scale_color_manual(values = pitch_colors) +
    coord_equal(xlim = c(-2, 2), ylim = c(0, 5)) +
    labs(x = "", y = "", fill = "") +
    theme(panel.grid = element_blank(),
          axis.text = element_blank())

  return(pitch_locations_plot)


}
