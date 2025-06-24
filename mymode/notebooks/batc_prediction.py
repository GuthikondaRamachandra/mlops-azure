# Databricks notebook source
import mlflow
import mlflow.sklearn
from mlflow.models import infer_signature
import pandas as pd
from sklearn.model_selection import train_test_split
from sklearn.ensemble import RandomForestClassifier
from sklearn.metrics import accuracy_score

# COMMAND ----------

# COMMAND ----------

# IMPORTS
import pandas as pd
import mlflow
import os

# COMMAND ----------

# STEP 1: Load batch input data from URL
url = "https://raw.githubusercontent.com/uiuc-cse/data-fa14/gh-pages/data/iris.csv"
batch_df = pd.read_csv(url)

# Drop label to match model input signature
input_df = batch_df.drop(columns=["species"])

# COMMAND ----------

# STEP 2: Load model from MLflow Model Registry
# Make sure the version exists or use "Production" if promoted
model_uri = "models:/iris_rf_model/1"  # or "models:/iris_rf_model/Production"
model = mlflow.pyfunc.load_model(model_uri)

# COMMAND ----------

# STEP 3: Run predictions
predictions = model.predict(input_df)

# COMMAND ----------

# STEP 4: Prepare result DataFrame
result_df = input_df.copy()
result_df["predicted_species"] = predictions
result_df["actual_species"] = batch_df["species"]

# COMMAND ----------

# STEP 5: Save to DBFS
output_path = "/dbfs/tmp/iris_batch_predictions.csv"
os.makedirs("/dbfs/tmp", exist_ok=True)
result_df.display(10)
result_df.to_csv(output_path, index=False)

print(f"✅ Batch predictions saved to: {output_path}")
