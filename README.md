# ocsf-mappings-docker
OCSF Mappings Docker - a docker instance with OCSF mapped events.


## How to run:
```sh
$ docker run --name ocsf_mappings --rm \
	--platform linux/amd64 \
	-v ./TA-OCSF_Mappings:/opt/splunk/etc/apps/TA-OCSF_Mappings \
	-p 8001:8000 -e "SPLUNK_PASSWORD=ocsfmappings" \
	-e "SPLUNK_START_ARGS=--accept-license" \
	-it splunk/splunk:latest
```

- Username: admin
- Password: ocsfmappings