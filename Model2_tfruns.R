# content of file 'Model2_tfruns.R'

# default flags for the code
FLAGS <- flags(
  flag_numeric("dropout", 0.3),
  flag_numeric("lambda", 0.01),
  flag_numeric("lr", 0.01),
  flag_numeric("bs", 100),
  flag_integer("size_1", 256)
  )

# model configuration
model_tune <- keras_model_sequential() %>%
  layer_dense(units = FLAGS$size_1, input_shape = V, activation = "relu", 
              name = "layer_1",
              kernel_regularizer = regularizer_l2(FLAGS$lambda)) %>%
  layer_dropout(rate = FLAGS$dropout) %>%
  layer_dense(units = 128, activation = "relu", name = "layer_2",
              kernel_regularizer = regularizer_l2(FLAGS$lambda)) %>%
  layer_dropout(rate = FLAGS$dropout) %>%
  layer_dense(units = 64, activation = "relu", name = "layer_3",
              kernel_regularizer = regularizer_l2(FLAGS$lambda)) %>%
  layer_dropout(rate = FLAGS$dropout) %>%
  layer_dense(units = ncol(y_train), activation = "softmax", name = "layer_out")%>%
  compile(loss = "categorical_crossentropy", metrics = "accuracy",
          optimizer = optimizer_rmsprop(learning_rate = FLAGS$lr),
  )

# training and evaluation
fit_model_tune <- model_tune %>% fit(
    x = x_train_dnn, y = y_train,
    validation_data = list(x_val_dnn, y_val),
    epochs = 100,
    batch_size = FLAGS$bs,
    verbose = 0,
    callbacks = callback_early_stopping(monitor = "val_accuracy", 
                                        patience = 20))