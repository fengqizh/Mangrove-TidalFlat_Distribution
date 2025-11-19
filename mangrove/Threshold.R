library(terra)
library(dplyr)

# Read raster layers
pred16 <- rast("F:/mangrove_data/threshold/raster/mangrove_2016.tif")
obs16  <- rast("F:/mangrove_data/threshold/raster/mangrove_ture_16.tif")
pred19 <- rast("F:/mangrove_data/threshold/raster/mangrove_2019.tif")
obs19  <- rast("F:/mangrove_data/threshold/raster/mangrove_ture_19.tif")

# 2016
stacked <- c(pred16, obs16)
# 2019   stacked <- c(pred19, obs19)
names(stacked) <- c("pred", "obs")

# Set tiling parameters
n_tiles <- 10               
tile_sample_n <- 30000     

# Raster extent
ext <- ext(stacked)
tile_width <- (ext[2] - ext[1]) / n_tiles

samples_all <- list()

# Sampling by tiles
for (i in 1:n_tiles) {
  # Tile boundaries
  x_min <- ext[1] + (i - 1) * tile_width
  x_max <- ext[1] + i * tile_width
  
  tile_ext <- ext(x_min, x_max, ext[3], ext[4])
  tile <- crop(stacked, tile_ext)
  
  # Valid mask (both pred & obs non-NA)
  valid_mask <- !is.na(tile[[1]]) & !is.na(tile[[2]])
  valid_cells <- which(values(valid_mask) == 1)
  
  if (length(valid_cells) == 0) {
    cat("Tile", i, "has no valid points, skipped.\n")
    next
  }
  
  # Full sampling if fewer points than max sampling number
  if (length(valid_cells) <= tile_sample_n) {
    sampled_cells <- valid_cells
    cat("Tile", i, "has fewer valid points (", length(valid_cells), "), using all.\n")
  } else {
    set.seed(2025 + i)
    sampled_cells <- sample(valid_cells, tile_sample_n)
  }
  
  # Coordinates and values
  sample_coords <- xyFromCell(tile, sampled_cells)
  sample_vals <- extract(tile, sampled_cells)
  sample_vals$ID <- NULL  # remove ID column
  
  # Merge coordinates and values
  df <- data.frame(
    x = sample_coords[,1],
    y = sample_coords[,2],
    sample_vals,
    tile = i
  )
  
  samples_all[[i]] <- df
}

# Combine all samples
samples_df <- bind_rows(samples_all)
head(samples_df)

# Total sample count
cat("Total sampled points:", nrow(samples_df), "\n")

# Save CSV
write.csv(samples_df, "F:/mangrove_data/threshold/sample_tiles_2016.csv", row.names = FALSE)
write.csv(samples_df, "F:/mangrove_data/threshold/sample_tiles_2019.csv", row.names = FALSE)



library(dplyr)
library(ggplot2)
library(caret)
library(data.table) 

# 1. Read sampling data
samples_df <- read.csv("F:/mangrove_data/threshold/sample_tiles_2016.csv")
samples_df <- read.csv("F:/mangrove_data/threshold/sample_tiles_2019.csv")

# Filter complete cases
df <- samples_df %>% filter(!is.na(pred), !is.na(obs))

# Threshold sequence
thresholds <- seq(0.01, 0.9, by = 0.01)

# Initialize results table
results <- data.frame()

for (t in thresholds) {
  # Binarize prediction
  pred_bin <- ifelse(df$pred >= t, 1, 0)
  
  # Ensure factor levels are consistent
  pred_factor <- factor(pred_bin, levels = c(0, 1))
  obs_factor  <- factor(df$obs, levels = c(0, 1))
  
  # Confusion matrix
  cm <- confusionMatrix(pred_factor, obs_factor, positive = "1")
  
  # Extract metrics
  res_row <- data.frame(
    threshold = t,
    Accuracy = cm$overall['Accuracy'],
    Kappa = cm$overall['Kappa'],
    Sensitivity = cm$byClass['Sensitivity'],
    Specificity = cm$byClass['Specificity'],
    Precision = cm$byClass['Precision'],
    F1 = cm$byClass['F1']
  )
  
  results <- rbind(results, res_row)
}

# Convert to data.table
results_dt <- as.data.table(results)

# Best threshold by F1 score
best_row <- results_dt[which.max(F1)]

cat("Best threshold based on max F1:", best_row$threshold, "\n")
print(best_row)

# Plot metrics across thresholds
library(reshape2)
res_melt <- melt(results_dt, id.vars = "threshold")

ggplot(res_melt, aes(x = threshold, y = value, color = variable)) +
  geom_line(size = 1) +
  labs(title = "Model evaluation metrics across thresholds",
       x = "Threshold",
       y = "Metric value") +
  theme_minimal() +
  geom_vline(xintercept = best_row$threshold, linetype = "dashed", color = "red") +
  theme(legend.title = element_blank())
