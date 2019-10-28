# Functions for residue conservation in multiple sequence alignments
# Kindly provided by Jose Almeida - November 2018

kld <- function(p,q) {
  #Function used to calculate the Kullback-Leibler Divergence
  tmp <- p * log(p/q)
  tmp[is.na(tmp)] <- 0
  sum(tmp) %>%
    return
}

jsd <- function(p,q,lambda) {
  #Function used to calculate the Shannon-Jensen Divergence
  r <- lambda * p + (1 - lambda) * q
  output <- lambda * kld(p,r) + (1 - lambda) * kld(q,r)
  return(output)
}

# p is the pssm column for a position
# q is the background distribution