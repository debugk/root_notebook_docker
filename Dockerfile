FROM rootproject/root-ubuntu16

# Run the following commands as super user (root):
USER root

# Install required packages for notebooks
RUN apt-get update && apt-get install -y \
       vim \
       python-pip && \
       pip install --upgrade pip && \
       pip install --upgrade setuptools && \
       pip install \
       jupyter \
       metakernel \
       zmq \
       six \
       keras==2.2.4 \
       Theano==1.0.4 \
       && rm -rf /var/lib/apt/lists/*

# Create a user that does not have root privileges 
ARG username=physicist
RUN userdel builder && useradd --create-home --home-dir /home/${username} ${username}
ENV HOME /home/${username}

WORKDIR /home/${username}

# Create the configuration file for jupyter and set owner
RUN echo "c.NotebookApp.ip = '*'" > jupyter_notebook_config.py && chown ${username} *

# Switch to our newly created user
USER ${username}

# Allow incoming connections on port 8888
EXPOSE 8888

