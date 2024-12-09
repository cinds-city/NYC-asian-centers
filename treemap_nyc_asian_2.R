#install packages
install.packages("treemap")
install.packages("dyplyr")
install.packages("showtext")

# Load necessary libraries
library(treemap)
library(dplyr)
library(showtext)

# Add Franklin Gothic Heavy font
font_add("Franklin Gothic Heavy", "C:/Windows/Fonts/FRADMCN.ttf")  

showtext_auto()

# Count the ethnicity 
ethnicity_counts <- data.frame(
  Ethnicity = c("Burmese", "Chinese", "Filipino", "Indian", "Japanese", 
                "Korean", "Nepal", "Other", "Sri Lankan", "Taiwanese", 
                "Thai", "Tibet", "Vietnamese"),
  Count = c(1, 20, 5, 14, 11, 13, 4, 4, 3, 3, 9, 2, 5)
)

# Calculate percentages of ethnicity and mutate
ethnicity_counts <- ethnicity_counts %>%
  mutate(Percentage = round(Count / sum(Count) * 100, 1))

# Combine percentage and ethnicity for labels; mutate
ethnicity_counts <- ethnicity_counts %>%
  mutate(Label = paste0(Percentage, "% ", Ethnicity))

# Plot the treemap with Flourescent yellow color
treemap(
  ethnicity_counts,                           # Data
  index = "Label",                            # Grouping variable (Percentage + Ethnicity)
  vSize = "Count",                            # Size of each rectangle
  type = "index",                             # Coloring based on groups
  palette = "#d1ff00",                        # Single color (Fluorescent Yellow)
  
  # Main Title
  title = "Distribution of NYC's Asian Cultural Centers by Ethnicity", 
  
  # Borders 
  border.col = "black",                       # Border color
  border.lwds = 1,                            # Border width
  
  # Labels inside rectangle
  fontsize.labels = 8,                       # Font size for labels
  fontcolor.labels = "black",                 # Font color for better contrast
  fontface.labels = 2,                        # Font face (bold)
  fontfamily.labels = "Franklin Gothic Heavy", # Custom font
  bg.labels = "transparent",                  # Background color for labels
  align.labels = c("left", "top"),            # Align labels to top-left corner
  overlap.labels = 0.5,                       # Allow some overlap
  inflate.labels = TRUE                       # Inflate labels based on rectangle size
)
