# Plot a PSICOV residue correlation matrix
# Aleix Lafita - November 2018 - EIPP Bioinformatics course

library(ggplot2)
library(dplyr)

# Parse the couplings data
data = read.csv("mypfam/family_uniprot_hmm.psicov", header = F, sep = " ")
names(data) = c("R1", "R2", "A", "B", "prob")

# Just take the top 100 couplings
data.filter = data %>%
  top_n(100, prob)

# Plot the correlation matrix 
p = ggplot(data.filter) +
  geom_point(aes(x = R1, y = R2, alpha = prob)) +
  geom_point(aes(x = R2, y = R1, alpha = prob)) +
  theme_bw() +
  theme(
    legend.position = "right"
  ) +
  scale_alpha_continuous(limits=c(0,1)) +
  scale_x_reverse()

# Save the plot to a file
pdf("mypfam/family_psicov.pdf", width = 5.5, height = 5)
print(p)
dev.off()

