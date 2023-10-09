## code to prepare `DATASET` dataset goes here
mp <- do.call(cbind, maps::map(plot = F)[1:2])
usethis::use_data(mp, overwrite = TRUE, internal = TRUE)
