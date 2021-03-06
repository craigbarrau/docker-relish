Docker image to push to Relish
==============================

This project contains a Docker image for pushing Cucumber Features to Relish Cloud (relishapp.com)
This image is ideal for CI servers which run the build steps on Docker.

The `RELISH_API_TOKEN` is intentionally set as an argument rather than an environment variable due to limitations in some CI servers which call Docker.

## Usage

### Command Line

Mount the directory containing your project at `/src` and set the following:

`docker run -v $PWD:/src:ro craigbarrau/relish <RELISH_API_TOKEN> <RELISH_PROJECT_NAME>`

### Bitbucket Pipelines

1. Add an Environment Variable to Bitbucket Pipelines for the `RELISH_API_TOKEN` and `RELISH_PROJECT_NAME`. If you have done a relish push before you can get the `RELISH_API_TOKEN` from `~/.relish`.
2. Create a `bitbucket-pipelines.yml` file in your project root.

```
image: craigbarrau/relish

pipelines:
  default:
    - step:
        script:
          - docker-entrypoint ${RELISH_API_TOKEN} ${RELISH_PROJECT_NAME}
```
