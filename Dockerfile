# Docker file, which can be used for CI or local testing
FROM ubuntu

# Otherwise, we get a prompt during the apt-get install
ENV DEBIAN_FRONTEND=noninteractive

# Install packages
RUN apt-get update
RUN apt-get install -y ruby python3.9 python3-pip shellcheck hunspell hunspell-en-gb
RUN gem install mdl

# Install mkdocs and other Python reqs
COPY . /proj
WORKDIR /proj
RUN pip install -r requirements.txt

# Run our tests
ENTRYPOINT ["./run_tests.sh"]
