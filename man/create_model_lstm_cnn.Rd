% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/create_model.R
\name{create_model_lstm_cnn}
\alias{create_model_lstm_cnn}
\title{Creates LSTM/CNN network}
\usage{
create_model_lstm_cnn(
  maxlen = 50,
  dropout = 0,
  recurrent_dropout = 0,
  layer_lstm = NULL,
  layer_dense = c(4),
  solver = "adam",
  learning.rate = 0.001,
  use.multiple.gpus = FALSE,
  merge.on.cpu = TRUE,
  gpu.num = 2,
  vocabulary.size = 4,
  bidirectional = FALSE,
  stateful = FALSE,
  batch.size = NULL,
  compile = TRUE,
  kernel_size = NULL,
  filters = NULL,
  strides = NULL,
  pool_size = NULL,
  padding = "same",
  dilation_rate = NULL,
  gap = FALSE,
  use_bias = TRUE,
  residual_block = FALSE,
  residual_block_length = 1,
  size_reduction_1Dconv = FALSE,
  label_input = NULL,
  zero_mask = FALSE,
  label_smoothing = 0,
  label_noise_matrix = NULL,
  last_layer_activation = "softmax",
  loss_fn = "categorical_crossentropy",
  num_output_layers = 1,
  auc_metric = FALSE
)
}
\arguments{
\item{maxlen}{Length of predictor sequence.}

\item{dropout}{Fraction of the units to drop for inputs.}

\item{recurrent_dropout}{Fraction of the units to drop for recurrent state.}

\item{layer_lstm}{Number of cells per network layer. Can be a scalar or vector.}

\item{layer_dense}{Dense layers of size layer_dense after last LSTM (or last CNN is \code{layers.lstm = 0}) layer.}

\item{solver}{Optimization method, options are "adam", "adagrad", "rmsprop" or "sgd".}

\item{learning.rate}{Learning rate for optimizer.}

\item{use.multiple.gpus}{If true, multi_gpu_model() will be used based on gpu_num.}

\item{merge.on.cpu}{True on default, false recommend if the server supports NVlink, only relevant if use.multiple.gpu is true.}

\item{gpu.num}{Number of GPUs to be used, only relevant if multiple_gpu is true.}

\item{vocabulary.size}{Number of unique character in vocabulary.}

\item{bidirectional}{Use bidirectional wrapper for lstm layers.}

\item{stateful}{Boolean. Whether to use stateful LSTM layer.}

\item{batch.size}{Number of samples that are used for one network update. Only used if \code{stateful = TRUE}.}

\item{compile}{Whether to compile the model.}

\item{kernel_size}{Size of 1d convolutional layers. For multiple layers, assign a vector. (e.g, rep(3,2) for two layers and kernel size 3)}

\item{filters}{Number of filters. For multiple layers, assign a vector.}

\item{strides}{Stride values. For multiple layers, assign a vector.}

\item{pool_size}{Integer, size of the max pooling windows. For multiple layers, assign a vector.}

\item{padding}{Padding of CNN layers, e.g. "same", "valid" or "causal".}

\item{dilation_rate}{Integer, the dilation rate to use for dilated convolution.}

\item{gap}{Whether to apply global average pooling after last CNN layer.}

\item{use_bias}{Boolean. Usage of bias for CNN layers.}

\item{residual_block}{Boolean. If true, the residual connections are used in CNN. It is not used in the first convolutional layer.}

\item{residual_block_length}{Integer. Determines how many convolutional layers (or triplets when size_reduction_1D_conv is TRUE) exist}

\item{size_reduction_1Dconv}{Boolean. When TRUE, the number of filters in the convolutional layers is reduced to 1/4 of the number of filters of}

\item{label_input}{Integer or NULL. If not NULL, adds additional input layer of \code{label_input} size.}

\item{zero_mask}{Boolean, whether to apply zero masking before LSTM layer. Only used if model does not use any CNN layers.}

\item{label_smoothing}{Float in [0, 1]. If 0, no smoothing is applied. If > 0, loss between the predicted 
labels and a smoothed version of the true labels, where the smoothing squeezes the labels towards 0.5.
The closer the argument is to 1 the more the labels get smoothed.}

\item{label_noise_matrix}{Matrix of label noises. Every row stands for one class and columns for percentage of labels in that class.
If first label contains 5% wrong labels and second label no noise, then
\code{label_noise_matrix <- matrix(c(0.95, 0.05, 0, 1), nrow = 2, by_row = TRUE )}}

\item{last_layer_activation}{Either "sigmoid" or "softmax".}

\item{loss_fn}{Either "categorical_crossentropy" or "binary_crossentropy". If label_noise_matrix given, will use custom "noisy_loss".}

\item{num_output_layers}{Number of output layers.}

\item{auc_metric}{Whether to add AUC metric.}
}
\description{
Creates a network consisting of an arbitrary number of CNN, LSTM and dense layers. 
Last layer is a dense layer with softmax activation.
}
