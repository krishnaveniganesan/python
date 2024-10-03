# Use the official Python image from the Docker Hub
FROM python:3.9-slim

# Set the working directory in the container
WORKDIR /app

# Copy the requirements file (make sure this file exists in your context)
COPY requirements.txt . 

# Install the required packages
RUN pip install --no-cache-dir -r requirements.txt

# Copy the application files into the container
COPY app.py .
COPY get.py .
Current Directory: /app
Traceback (most recent call last):
  File "/app/app.py", line 12, in <module>
    dataset = pd.read_csv("/var/lib/jenkins/workspace/python/Salary_Data.csv")
  File "/usr/local/lib/python3.9/site-packages/pandas/io/parsers/readers.py", line 1026, in read_csv
    return _read(filepath_or_buffer, kwds)
  File "/usr/local/lib/python3.9/site-packages/pandas/io/parsers/readers.py", line 620, in _read
    parser = TextFileReader(filepath_or_buffer, **kwds)
  File "/usr/local/lib/python3.9/site-packages/pandas/io/parsers/readers.py", line 1620, in __init__
    self._engine = self._make_engine(f, self.engine)
  File "/usr/local/lib/python3.9/site-packages/pandas/io/parsers/readers.py", line 1880, in _make_engine
    self.handles = get_handle(
  File "/usr/local/lib/python3.9/site-packages/pandas/io/common.py", line 873, in get_handle
    handle = open(
FileNotFoundError: [Errno 2] No such file or directory: '/var/lib/jenkins/workspace/python/Salary_Data.csv'



i am getting above error

# Use the official Python image from the Docker Hub
FROM python:3.9-slim

# Set the working directory in the container
WORKDIR /app

# Copy the requirements file (make sure this file exists in your context)
COPY requirements.txt . 

# Install the required packages
RUN pip install --no-cache-dir -r requirements.txt

# Copy the application files into the container
COPY app.py .
COPY get.py .
COPY Salary_Data.csv .
COPY regressor_joblib.sav .

# Expose the port that your app will run on (if applicable)
EXPOSE 5000

# Command to run your application
CMD ["python", "app.py"]





# Expose the port that your app will run on (if applicable)
EXPOSE 5000

# Command to run your application
CMD ["python", "app.py"]
