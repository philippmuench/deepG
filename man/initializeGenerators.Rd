% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/generators.R
\name{initializeGenerators}
\alias{initializeGenerators}
\title{Initializes generators defined by labelByFolderGenerator function}
\usage{
initializeGenerators(
  directories,
  format = "fasta",
  batch.size = 256,
  maxlen = 250,
  max_iter = 10000,
  vocabulary = c("a", "c", "g", "t"),
  verbose = FALSE,
  randomFiles = FALSE,
  step = 1,
  showWarnings = FALSE,
  seed = 1234,
  shuffleFastaEntries = FALSE,
  numberOfFiles = NULL,
  fileLog = NULL,
  reverseComplements = FALSE,
  reverseComplementEncoding = FALSE,
  val = FALSE,
  ambiguous_nuc = "zero",
  proportion_per_file = NULL,
  target_middle = FALSE,
  read_data = FALSE,
  use_quality_score = FALSE,
  padding = TRUE,
  added_label_path = NULL,
  add_input_as_seq = NULL,
  skip_amb_nuc = NULL,
  max_samples = NULL,
  split_seq = FALSE,
  concat_seq = NULL
)
}
\arguments{
\item{directories}{Vector of paths to folder containing fasta files. Files in one folder should belong to one class.}

\item{format}{File format.}

\item{batch.size}{Number of batches, will get rounded to be multiple of number of targets if necessary.}

\item{maxlen}{Length of predictor sequence.}

\item{max_iter}{Stop after max_iter number of iterations failed to produce a new batch.}

\item{vocabulary}{Vector of allowed characters, character outside vocabulary get encoded as 0-vector.}

\item{verbose}{Whether to show message.}

\item{randomFiles}{Logical, whether to go through files randomly or sequential.}

\item{step}{How often to take a sample.}

\item{showWarnings}{Logical, give warning if character outside vocabulary appears.}

\item{seed}{Sets seed for set.seed function, for reproducible results when using \code{randomFiles} or \code{shuffleFastaEntries}}

\item{shuffleFastaEntries}{Logical, shuffle fasta entries.}

\item{numberOfFiles}{Use only specified number of files, ignored if greater than number of files in \code{directories}.}

\item{fileLog}{Write name of files to csv file if path is specified.}

\item{reverseComplements}{Logical, half of batch contains sequences and other its reverse complements. Reverse complement 
is given by reversed order of sequence and switching A/T and C/G. \code{batch.size} argument has to be even, otherwise 1 will be added
to \code{batch.size}}

\item{reverseComplementEncoding}{Logical, use both original sequence and reverse.complement as two input sequences.}

\item{val}{Logical, call initialized generarator "genY" or "genValY" where Y is an integer between 1 and length of directories.}

\item{ambiguous_nuc}{How to handle nucleotides outside vocabulary, either "zero", "discard" or "equal". If "zero", input gets encoded as zero vector; 
if "equal" input is 1/length(vocabulary) x length(vocabulary). If "discard" samples containing nucleotides outside vocabulary get discarded.}

\item{proportion_per_file}{Numerical value between 0 and 1. Proportion of possible samples to take from one file. Takes samples from random subsequence.}

\item{target_middle}{Split input sequence into two sequences while removing nucleotide in middle. If input is x_1,..., x_(n+1), input gets split into 
input_1 = x_1,..., x_m and input_2 = x_(n+1),..., x_(m+2) where m = ceiling((n+1)/2) and n = maxlen. Note that x_(m+1) is not used.}

\item{read_data}{If true the first element of output is a list of length 2, each containing one part of paired read.}

\item{use_quality_score}{Whether to use fastq qualitiy scores. If TRUE input is not one-hot-encoding but corresponds to probabilities.
For example (0.97, 0.01, 0.01, 0.01) instead of (1, 0, 0, 0).}

\item{padding}{Whether to pad sequences too short for one sample with zeros.}

\item{added_label_path}{Path to folder with additional labels. Should be a csv file with one column named "file". Other columns should correspond to one label.}

\item{add_input_as_seq}{Boolean vector specifying for each entry in \code{added_label_path} if rows from csv should be encoded as a sequence or used directly.
If a row in your csv file is a sequence this should be true. For example you may want to add another sequence, say ACCGT. Then this would correspond to 1,2,2,3,4 in
csv file (if vocabulary = c("A", "C", "G", "T")).  If \code{add_input_as_seq} is TRUE, 12234 gets one-hot encoded, so added input is a 3D tensor.  If \code{add_input_as_seq} is 
FALSE this will feed network just raw data (a 2D tensor).}

\item{skip_amb_nuc}{Threshold of ambiguous nucleotides to accept in fasta entry. Complete entry will get discarded otherwise.}

\item{max_samples}{Maximum number of samples to use from one file. If not NULL and file has more than \code{max_samples} samples, will randomly choose a 
subset of \code{max_samples} samples.}

\item{concat_seq}{Character string or NULL. If not NULL all entries from file get concatenated to one sequence with concat_seq string between them.
Example: If 1.entry AACC, 2. entry TTTG and concat_seq = "ZZZ" this becomes AACCZZZTTTG.}
}
\description{

}
