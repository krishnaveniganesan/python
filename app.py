from flask import Flask, jsonify
import os
import numpy as np
import pandas as pd
from sklearn.linear_model import LinearRegression
from sklearn.model_selection import train_test_split
from sklearn.metrics import r2_score
import joblib

app = Flask(__name__)

@app.route('/predict', methods=['GET'])
def predict():
    current_directory = os.getcwd()
    print("Current Directory:", current_directory)

    # Load the dataset
    dataset = pd.read_csv("Salary_Data.csv")
    X = dataset.iloc[:, :-1].values
    y = dataset.iloc[:, -1].values

    # Train the model
    X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=1/3, random_state=0)
    regressor = LinearRegression()
    regressor.fit(X_train, y_train)

    # Make a prediction
    prediction = regressor.predict([[3]])
    acc = r2_score(y, regressor.predict(X))

    return jsonify({
        "prediction": prediction[0].tolist(),
        "r2_score": acc
    })

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
