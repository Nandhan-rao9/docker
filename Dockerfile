# Use the official Python image
FROM python:3.10-slim

# Set the working directory in the container
WORKDIR /app

# Copy the requirements file into the container
COPY requirements.txt .

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the Streamlit app code
COPY . .

# Expose Streamlit's default port (8501)
EXPOSE 8501

# Run the Streamlit app when the container starts
CMD ["streamlit", "run", "open.py", "--server.enableCORS=true"]
