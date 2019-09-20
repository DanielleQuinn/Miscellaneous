# Generate example data frame
df <- data.frame(species_id = c("A", "B", "C", "A", "C", "A", "B", "C"),
                 common_names = c("bobcat, lynx",
                                  "white-tailed deer",
                                  "balsam fir, colorado fir",
                                  "bobcat",
                                  "colorado fir, white balsam",
                                  "red lynx, bobcat",
                                  "deer",
                                  "balsam, colorado fir"))

df

# I want to find the most common common name for each species and populate a column with that value

find_common <- function(input) {
  df %>%
    filter(species_id == input) %>%
    pull(common_names) %>%
    paste0(collapse = ",") %>%
    str_split(",") %>%
    unlist() %>%
    trimws() %>%
    table() %>%
    which.max() %>%
    names() %>%
    return()
}

df %>%
  group_by(species_id) %>%
  mutate(new_common_name = find_common(unique(species_id)))
