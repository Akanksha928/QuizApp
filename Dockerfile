# Use official lightweight Python image
FROM python:3.9-slim

# Set working directory inside the container
WORKDIR /app

# Copy the application files
COPY . /app

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Ensure the database is created before running
RUN python -c "import app; app.init_db()"

# Expose the application port
EXPOSE 8080

# Command to run the app
CMD ["python", "app.py"]
