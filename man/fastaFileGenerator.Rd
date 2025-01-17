% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/generators.R
\name{fastaFileGenerator}
\alias{fastaFileGenerator}
\title{Custom generator for fasta/fastq files}
\usage{
fastaFileGenerator(
  corpus.dir,
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
  output_format = "target_right",
  ambiguous_nuc = "zeros",
  use_quality_score = FALSE,
  proportion_per_file = NULL,
  padding = TRUE,
  added_label_path = NULL,
  add_input_as_seq = NULL,
  skip_amb_nuc = NULL,
  max_samples = NULL,
  concat_seq = NULL,
  target_len = 1
)
}
\arguments{
\item{corpus.dir}{Input directory where .fasta files are located or path to single file ending with .fasta or .fastq 
(as specified in format argument). Can also be a list of directories.}

\item{format}{File format, either fasta or fastq.}

\item{batch.size}{Number of batches.}

\item{maxlen}{Length of predictor sequence.}

\item{max_iter}{Stop after max_iter number of iterations failed to produce a new batch.}

\item{vocabulary}{Vector of allowed characters, character outside vocabulary get encoded as 0-vector.}

\item{verbose}{Whether to show message.}

\item{randomFiles}{Logical, whether to go through files randomly or sequential.}

\item{step}{How often to take a sample.}

\item{showWarnings}{Logical, give warning if character outside vocabulary appears}

\item{seed}{Sets seed for set.seed function, for reproducible results when using \code{randomFiles} or \code{shuffleFastaEntries}}

\item{shuffleFastaEntries}{Logical, shuffle entries in every fasta file before connecting them to sequence.}

\item{numberOfFiles}{Use only specified number of files, ignored if greater than number of files in corpus.dir.}

\item{fileLog}{Write name of files to csv file if path is specified.}

\item{reverseComplements}{Logical, for every new file decide randomly to use original data or its reverse complement.}

\item{output_format}{Determines shape of output tensor for language model.
Either "target_right", "target_middle_lstm", "target_middle_cnn" or "wavenet".
Assume a sequence "AACCGTA". Output correspond as follows
"target_right": X = "AACCGT", Y = "A"
"target_middle_lstm": X = (X_1 = "AAC", X_2 = "ATG"), Y = "C" (note reversed order of X_2)
"target_middle_cnn": X = "AACGTA", Y = "C" 
"wavenet": X = "AACCGT", Y = "ACCGTA"}

\item{ambiguous_nuc}{How to handle nucleotides outside vocabulary, either "zero", "discard", "empirical" or "equal". If "zero", input gets encoded as zero vector; 
if "equal" input is 1/length(vocabulary) x length(vocabulary). If "discard" samples containing nucleotides outside vocabulary get discarded. 
If "empirical" use nucleotide distribution of current file.}

\item{use_quality_score}{Whether to use fastq qualitiy scores. If TRUE input is not one-hot-encoding but corresponds to probabilities.
For example (0.97, 0.01, 0.01, 0.01) instead of (1, 0, 0, 0).}

\item{proportion_per_file}{Numerical value between 0 and 1. Proportion of possible samples to take from one file. Takes samples from random subsequence.}

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

\item{target_len}{Number of nucleotides to predict at once.}
}
\description{
\code{fastaFileGenerator} Iterates over folder containing .fasta/.fastq files and produces one-hot-encoding of predictor sequences 
and target variables.
}
