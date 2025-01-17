% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/preprocess.R
\name{preprocessFasta}
\alias{preprocessFasta}
\title{Wrapper of the preprocessSemiRedundant()-function}
\usage{
preprocessFasta(
  path,
  maxlen = 250,
  vocabulary = c("l", "p", "a", "c", "g", "t"),
  verbose = F
)
}
\arguments{
\item{path}{path to the FASTA file}

\item{maxlen}{length of the semi-redundant sequences}

\item{vocabulary}{char contains the vocabulary from the input char
If no vocabulary exists, it is generated from the input char}

\item{verbose}{TRUE/FALSE}
}
\description{
Is called on the genomic contents of one
FASTA file. Multiple entries are combined with newline characters.
}
