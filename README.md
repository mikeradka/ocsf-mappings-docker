# ocsf-mappings-docker
OCSF Mappings Docker - a Splunk docker instance with OCSF mapped events.

[Docker Hub Repository: ocsf-mappings](https://hub.docker.com/repository/docker/mrsplunk/ocsf-mappings/general)

## How to run:
```sh
$ docker run --name ocsf-mappings --rm \
	--platform linux/amd64 \
	-p 8000:8000 \
	-it mrsplunk/ocsf-mappings:latest
```

Once you see this, you are ready to open a browser and log in:

```
Ansible playbook complete, will begin streaming splunkd_stderr.log
```

## Log In:
- Open http://localhost:8000/
- Username: `admin`
- Password: `ocsfmappings`

## How to search:

- Set the date-time picker to `All time` if it's not already configured.
- Query the `ocsf` index:

```js
index=ocsf
```

- Try some simple searches:

```js
index=ocsf sourcetype=ocsf:okta:im2:log 
| stats count by category_name, class_name, activity_name
```

```js
index=ocsf 
| stats count by category_name, class_name, activity_name, metadata.version, metadata.event_code
| sort - count
```

## Adding more data
You can also mount a volume with additional datasets for monitoring in Splunk using `-v`:

```sh
$ docker run --name ocsf-mappings --rm \
  --platform linux/amd64 \
  -p 8000:8000 \
  -v /your/src/dataset_name:/your/dst/dataset_name \
  -it mrsplunk/ocsf-mappings:latest
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