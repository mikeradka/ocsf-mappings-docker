# Use the official Splunk image as the base
FROM splunk/splunk:latest

# Set environment variables
ENV SPLUNK_PASSWORD=ocsfmappings
ENV SPLUNK_START_ARGS=--accept-license

# Copy the TA-OCSF_Mappings directory into the container
COPY ./TA-OCSF_Mappings /opt/splunk/etc/apps/TA-OCSF_Mappings

# Expose the SplunkWeb Port
EXPOSE 8000