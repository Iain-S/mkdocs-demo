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

Once you are sure the checks are passing on the `main` branch, you can deploy to GitHub Pages with `mkdocs gh-deploy`

## ToDo

1. It doesn't make sense to install Python on the container unless we want to be able to run `mkdocs build/serve/gh-deply` from the container

1. We should be able to build the docs with `mkdocs build` and then deploy them with [this](https://github.com/marketplace/actions/deploy-to-github-pages) GitHub action
