% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/tSNE.R
\name{generateStatesFromFolder}
\alias{generateStatesFromFolder}
\title{generate states list for tSNE from a fasta folder
it is expected that the length of each fasta file is equal}
\usage{
generateStatesFromFolder(
  fasta.folder = "example_files/fasta",
  model.path = "example_files/dummy_model_cpu.hdf5",
  maxlen = 80,
  batch.size = 500,
  save = T,
  output.folder = "example_files/states/",
  verbose = T,
  exact = F
)
}
\arguments{
\item{fasta.folder}{path to fasta folder}

\item{model.path}{path to model file}

\item{maxlen}{length of semi-redundant chunks}

\item{batch.size}{how many chunks are predicted in parallel}

\item{save}{if TRUE, output will be written to file}

\item{output.folder}{path to output folder with tailing "/"}

\item{verbose}{TRUE/FALSE}

\item{exact}{keep exact values and dont round}
}
\description{
generate states list for tSNE from a fasta folder
it is expected that the length of each fasta file is equal
}
