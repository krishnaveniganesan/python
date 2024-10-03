# Use the official Python image from the Docker Hub
FROM python:3.9-slim

# Set the working directory in the container
WORKDIR /app

# Copy the requirements file (if you have one) to the working directory
COPY requirements.txt .  # Make sure this file exists

# Install the required packages
RUN pip install --no-cache-dir -r requirements.txt

# Copy the application files into the container
COPY app.py .
COPY get.py .

# Expose the port that your app will run on (if applicable)
EXPOSE 5000

# Command to run your application
CMD ["python", "app.py"]
