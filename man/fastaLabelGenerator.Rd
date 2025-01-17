% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/generators.R
\name{fastaLabelGenerator}
\alias{fastaLabelGenerator}
\title{Custom generator for fasta files and label targets}
\usage{
fastaLabelGenerator(
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
  labelVocabulary = c("x", "y", "z"),
  reverseComplements = TRUE,
  ambiguous_nuc = "zero",
  proportion_per_file = NULL,
  read_data = FALSE,
  use_quality_score = FALSE,
  padding = TRUE,
  skip_amb_nuc = NULL,
  max_samples = NULL,
  concat_seq = NULL,
  added_label_path = NULL,
  add_input_as_seq = NULL,
  target_from_csv = NULL,
  target_split = NULL
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

\item{showWarnings}{Logical, give warning if character outside vocabulary appears.}

\item{seed}{Sets seed for set.seed function, for reproducible results when using \code{randomFiles} or \code{shuffleFastaEntries}}

\item{shuffleFastaEntries}{Logical, shuffle fasta entries.}

\item{numberOfFiles}{Use only specified number of files, ignored if greater than number of files in corpus.dir.}

\item{fileLog}{Write name of files to csv file if path is specified.}

\item{labelVocabulary}{Character vector of possible targets. Targets outside \code{labelVocabulary} will get discarded.}

\item{reverseComplements}{Logical, half of batch contains sequences and other its reverse complements. Reverse complement 
is given by reversed order of sequence and switching A/T and C/G. \code{batch.size} argument has to be even, otherwise 1 will be added
to \code{batch.size}}

\item{ambiguous_nuc}{How to handle nucleotides outside vocabulary, either "zero", "discard", "empirical" or "equal". If "zero", input gets encoded as zero vector; 
if "equal" input is 1/length(vocabulary) x length(vocabulary). If "discard" samples containing nucleotides outside vocabulary get discarded. 
If "empirical" use nucleotide distribution of current file.}

\item{proportion_per_file}{Numerical value between 0 and 1. Proportion of possible samples to take from one file. Takes samples from random subsequence.}

\item{read_data}{If true the first element of output is a list of length 2, each containing one part of paired read. Maxlen should be 2*length of one read.}

\item{use_quality_score}{Whether to use fastq qualitiy scores. If TRUE input is not one-hot-encoding but corresponds to probabilities.
For example (0.97, 0.01, 0.01, 0.01) instead of (1, 0, 0, 0).}

\item{padding}{Whether to pad sequences too short for one sample with zeros.}

\item{skip_amb_nuc}{Threshold of ambiguous nucleotides to accept in fasta entry. Complete entry will get discarded otherwise.}

\item{max_samples}{Maximum number of samples to use from one file. If not NULL and file has more than \code{max_samples} samples, will randomly choose a 
subset of \code{max_samples} samples.}

\item{concat_seq}{Character string or NULL. If not NULL all entries from file get concatenated to one sequence with concat_seq string between them.
Example: If 1.entry AACC, 2. entry TTTG and concat_seq = "ZZZ" this becomes AACCZZZTTTG.}

\item{added_label_path}{If not NULL, get output from csv file. The file should have one column named "file" and one column for every label.}

\item{add_input_as_seq}{Boolean vector specifying for each entry in \code{added_label_path} if rows from csv should be encoded as a sequence or used directly.
If a row in your csv file is a sequence this should be true. For example you may want to add another sequence, say ACCGT. Then this would correspond to 1,2,2,3,4 in
csv file (if vocabulary = c("A", "C", "G", "T")).  If \code{add_input_as_seq} is TRUE, 12234 gets one-hot encoded, so added input is a 3D tensor.  If \code{add_input_as_seq} is 
FALSE this will feed network just raw data (a 2D tensor).}

\item{target_from_csv}{Path to csv file with target mapping. One column should be called "file" and other entries in row are the targets.}

\item{target_split}{If target gets read from csv file, list of names to devide target tensor into list of tensors.
Example: if csv file has header names "file", "label_1", "label_2", "label_3" und target_split = list(c("label_1", "label_2"), "label_3"),
this will devide target matrix to list of length 2, where the first element contains columns named "label_1" and "label_2" and the 
second entry contains the column named "label_3".}
}
\value{
A list of length 2. First element is a 3-dimensional tensor with dimensions (batch.size, maxlen, length(vocabulary)), encoding 
the predictor sequences. Second element is a matrix with dimensions (batch.size, length(labelVocabulary)), encoding the targets.
}
\description{
\code{fastaLabelGenerator} Iterates over folder containing .fasta files and produces one-hot-encoding of predictor sequences 
and target variables. Targets will be read from fasta headers.
}
