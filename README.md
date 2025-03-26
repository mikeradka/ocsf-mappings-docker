# ocsf-mappings-docker
OCSF Mappings Docker - a docker instance with OCSF mapped events.


## How to run:
```sh
$ docker run --name ocsf_mappings --rm \
	--platform linux/amd64 \
	-v ./TA-OCSF_Mappings:/opt/splunk/etc/apps/TA-OCSF_Mappings \
	-p 8000:8000 -e "SPLUNK_PASSWORD=ocsfmappings" \
	-e "SPLUNK_START_ARGS=--accept-license" \
	-it splunk/splunk:latest
```

## Log In:
- Open http://localhost:8000/
- Username: `admin`
- Password: `ocsfmappings`

## How to search:

- Set search period to `All time`.
- Query the `ocsf` index:

```js
index=ocsf
```