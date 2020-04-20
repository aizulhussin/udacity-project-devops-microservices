FROM python:3.7.3-stretch

## Step 1:
# Create a working directory
WORKDIR /app

## Step 2:
# Copy source code to working directory
COPY src /app
COPY requirements.txt /app


## Step 3:
# Install packages from requirements.txt
# hadolint ignore=DL3013
RUN pip install -r requirements.txt

## Step 4:
# Expose port 80
EXPOSE 8080/tcp

## Step 5:
# Run app.py at container launch
ENTRYPOINT ["python"]

CMD ["app.py"]

