# Dagster libraries for webserver and daemon (no code access)
FROM python:3.13-slim

# Copy requirements.txt separately for caching
COPY requirements.txt /opt/dagster/requirements.txt

# Install dependencies
RUN pip install --no-cache-dir -r /opt/dagster/requirements.txt

# Set up Dagster home and configs
ENV DAGSTER_HOME=/opt/dagster/dagster_home/
RUN mkdir -p $DAGSTER_HOME
WORKDIR $DAGSTER_HOME
