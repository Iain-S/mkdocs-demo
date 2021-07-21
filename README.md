# A docs site

A template mkdocs site

## Setup Instructions

### Without Docker

1. Create a virtual environment with `virtualenv venv` and activate it with `source venv/bin/activate`

1. Install the Python requirements with `pip install -r requirements.txt`

1. [optional] If you have Ruby, install markdownlint with `gem install mdl`

1. [optional] If you want to lint Bash scripts, install [shellcheck](https://github.com/koalaman/shellcheck#installing)

1. [optional] If you want to do spellchecking, install [hunspell](http://hunspell.github.io/)

1. Check that all tests pass with `./run_tests.sh`

### With Docker

1. Install Docker

1. Build the image with `docker build -f Dockerfile .` and make a note of the image checksum

1. Run a container with `docker run -i -t --entrypoint=/bin/bash my-image-checksum`

1. [optional] To rerun the same container but with new code, you can use the --volume option `docker run -i -t -v $(pwd):/usr/src/code --entrypoint=/bin/bash my-image-checksum`

## Deployment

Once you are sure the checks are passing on your branch, you can open a PR and merge into `main`. `main` will be deployed automatically by our [workflow](.github/workflows/main.yml).

## ToDo

1. Should we run `mkdocs gh-deploy` from within our container rather than the default ubuntu-latest? That way, we know the test and deployment Python versions will be the same.
