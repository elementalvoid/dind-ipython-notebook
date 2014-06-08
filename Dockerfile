FROM jpetazzo/dind
Maintainer Matt Klich, Mike Risse

# Build: docker build -t dind-ipython-notebook:latest .
# Run:   docker run -d -P dind-ipython-notebook:latest

RUN apt-get update; \
  DEBIAN_FRONTEND=noninteractive apt-get --no-install-recommends install --yes \
    git wget build-essential python-dev ipython ipython-notebook python-pip \
    python-numpy python-scipy python-matplotlib python-pandas python-sympy \
    python-nose python-sklearn libsndfile-dev; \
  pip install scikits.audiolab docker-py

ADD ./notebook/ /tmp/notebook/

EXPOSE 8080
EXPOSE 9000
CMD wrapdocker & ipython notebook --no-browser --ip=0.0.0.0 --port=8080 --notebook-dir=/tmp/notebook/

