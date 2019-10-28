# Plot a PSICOV residue correlation matrix
# Aleix Lafita - November 2018 - EIPP Bioinformatics course

library(ggplot2)
library(dplyr)

input = "mypfam/family_uniprot_hmm.psicov"

# Parse the couplings data
data = read.csv(input, header = F, sep = " ")
names(data) = c("R1", "R2", "A", "B", "prob")

# Just take the top 100 couplings
data.filter = data %>%
  top_n(500, prob)

# Plot the correlation matrix 
p = ggplot(data.filter) +
  geom_point(aes(x = R1, y = R2, alpha = prob)) +
  geom_point(aes(x = R2, y = R1, alpha = prob)) +
  theme_bw() +
  theme(
    legend.position = "right"
  ) +
  #scale_alpha_continuous(limits=c(0,1)) +
  scale_y_reverse(limits = c(max(data$R1), min(data$R1))) +
  xlim(min(data$R1), max(data$R1))

# Save the plot to a file
pdf("mypfam/family_psicov.pdf", width = 5.5, height = 5)
print(p)
dev.off()

