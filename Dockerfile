# Use a lightweight base image with Python
FROM python:3.9-slim

# Set the working directory in the container
WORKDIR /app

# Copy the requirements file if you have one
# Uncomment the line below if you have a requirements.txt file
# COPY requirements.txt .

# Install any needed packages specified in requirements.txt
# Uncomment the line below if you have a requirements.txt file
# RUN pip install --no-cache-dir -r requirements.txt

# Copy the application files into the container
COPY /workspace/app.py .
COPY /workspace/get_post.py .

# Expose a port if your app runs a web server (e.g., Flask on port 5000)
EXPOSE 5000

# Command to run your application
CMD ["python", "app.py"]
