
# Use a base image with Node.js and Python
FROM node:20-slim

# Install Python and pip
RUN apt-get update && apt-get install -y python3 python3-pip python3-venv && rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /app

# Create and activate a Python virtual environment
RUN python3 -m venv venv
ENV PATH="/app/venv/bin:$PATH"

# Copy package.json and install Node.js dependencies for copilot-api
COPY package.json package-lock.json ./ 
RUN npm install

# Copy OpenHands related files (assuming they will be in a 'openhands' directory)
COPY openhands/requirements.txt ./openhands/
RUN pip install --no-cache-dir -r ./openhands/requirements.txt

# Copy the rest of the application code
COPY . .

# Expose the port copilot-api listens on
EXPOSE 4141

# Command to run both copilot-api and OpenHands
CMD npx copilot-api@latest start & python3 openhands/main.py


