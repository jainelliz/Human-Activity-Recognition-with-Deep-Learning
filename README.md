# Human Activity Recognition with Deep Learning

This project builds and compares DNN, tuned DNN, and CNN models for classifying human activities based on motion sensor data collected in 2023.

## Highlights
- Designed and trained deep learning models using R and Keras
- Applied dropout, L2 regularization, and early stopping
- Tuned hyperparameters using `tfruns`
- Achieved 99.1% validation accuracy with CNN

## Tools & Libraries
- R, Keras, `tfruns`, `ggplot2`, etc.

## Structure
- `activity_model.qmd` – Quarto source for training & evaluation
- `activity_model.pdf` – Rendered report
- `data_activity_recognition.RData` – Sensor input data
-  `Model2_tfruns.R` – Separate R script for hyperparameter tuning using `tfruns`
