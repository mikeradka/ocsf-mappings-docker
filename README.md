# ocsf-mappings-docker
OCSF Mappings Docker - a docker instance with OCSF mapped events.

```sh
$ docker run --rm --platform linux/amd64 \
	-p 8000:8000 -e "SPLUNK_PASSWORD=ocsfmappings" \
	-e "SPLUNK_START_ARGS=--accept-license" \
	-it splunk/splunk:latest
```