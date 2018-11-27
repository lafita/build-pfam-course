# Plot a PLMC (EV couplings) residue couplings matrix
# Aleix Lafita - November 2018 - EIPP Bioinformatics course

library(ggplot2)
library(dplyr)

# Parse the couplings data
data = read.csv("mypfam/family_uniprot_couplings.txt", header = F, sep = " ")
names(data) = c("RES_I", "FOCUS_AI", "RES_J", "FOCUS_AJ", "0", "SCORE")

# Plot the correlation matrix 
p = ggplot(data) +
  geom_tile(aes(x = RES_I, y = RES_J, fill = SCORE)) +
  geom_tile(aes(x = RES_J, y = RES_I, fill = SCORE)) +
  theme_bw() +
  theme(
    legend.position = "right",
    panel.grid = element_blank()
  ) +
  scale_fill_gradient2() +
  scale_x_reverse()

# Save the plot to a file
pdf("mypfam/family_couplings.pdf", width = 5.5, height = 5)
print(p)
dev.off()
