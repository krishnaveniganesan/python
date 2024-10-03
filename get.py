from flask import Flask, redirect, url_for, request,jsonify
import joblib
app = Flask(__name__)

@app.route('/linearregression',methods = ['GET'])
def linearregression():
   if request.method == 'GET':
      Experience= request.form['Experience']
      rj= joblib.load('regressor_joblib.sav')
      salary =rj.predict([[float(Experience)]])
      return jsonify(salary=salary[0])

if __name__ == '__main__':
   app.run(host='0.0.0.0', port=5000,debug = True)
