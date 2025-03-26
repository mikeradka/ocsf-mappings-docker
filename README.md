# ocsf-mappings-docker
OCSF Mappings Docker - a docker instance with OCSF mapped events.

## How to run:
```sh
$ docker run --name ocsf-mappings --rm \
	--platform linux/amd64 \
	-p 8000:8000 \
	-it mrsplunk/ocsf-mappings:latest
```

## Log In:
- Open http://localhost:8000/en-US/app/search/search/
- Username: `admin`
- Password: `ocsfmappings`

## How to search:

- Set date-time picker to `All time`.
- Query the `ocsf` index:

```js
index=ocsf
```

- Try some simple searches:

```js
index=ocsf
| stats cou
```

```js
index=ocsf sourcetype=ocsf:okta:im2:log 
| stats count by category_name, class_name, activity_name
```

## Docker Troubleshooting
```sh
$ docker run --name ocsf-mappings --rm \
	--platform linux/amd64 \
	-v ./TA-OCSF_Mappings:/opt/splunk/etc/apps/TA-OCSF_Mappings \
	-p 8000:8000 -e "SPLUNK_PASSWORD=ocsfmappings" \
	-e "SPLUNK_START_ARGS=--accept-license" \
	-it splunk/splunk:latest
```