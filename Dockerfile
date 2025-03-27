# Use the official Splunk image as the base
FROM splunk/splunk:latest

# Set environment variables
ENV SPLUNK_PASSWORD=ocsfmappings
ENV SPLUNK_START_ARGS=--accept-license

# Copy the TA-OCSF_Mappings directory into the container
COPY TA-OCSF_Mappings /opt/splunk/etc/apps/TA-OCSF_Mappings

# Copy user-prefs.conf into the system local settings
# This sets the default search earliest to 'All time'
COPY config/user-prefs.conf /opt/splunk/etc/system/local/user-prefs.conf

# Disable the ui tour
COPY config/ui-tour.conf /opt/splunk/etc/system/local/ui-tour.conf

# Add the global banner
COPY config/global-banner.conf /opt/splunk/etc/system/local/global-banner.conf

# Expose the SplunkWeb Port
EXPOSE 8000