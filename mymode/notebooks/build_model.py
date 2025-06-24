# Databricks notebook source
import mlflow
import mlflow.sklearn
from mlflow.models import infer_signature
import pandas as pd
from sklearn.model_selection import train_test_split
from sklearn.ensemble import RandomForestClassifier
from sklearn.metrics import accuracy_score

# COMMAND ----------

# Load online data
url = "https://raw.githubusercontent.com/uiuc-cse/data-fa14/gh-pages/data/iris.csv"
df = pd.read_csv(url)
X = df.drop("species", axis=1)
y = df["species"]

# Split
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.3, random_state=42)

# Train model
model = RandomForestClassifier(n_estimators=100, random_state=42)
model.fit(X_train, y_train)

# Predict and evaluate
preds = model.predict(X_test)
acc = accuracy_score(y_test, preds)

# Infer signature from inputs and predictions
signature = infer_signature(X_test, preds)

with mlflow.start_run(run_name="iris_rf_training"):
    mlflow.log_metric("test_accuracy", acc)

    # Log model with signature
    mlflow.sklearn.log_model(
        sk_model=model,
        artifact_path="model",
        registered_model_name="iris_rf_model",
        signature=signature
    )

