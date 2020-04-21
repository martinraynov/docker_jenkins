FROM jenkins/jenkins:lts as jenkins_local

USER root

RUN apt-get update \
    && apt-get -y install \
        apt-transport-https \
        ca-certificates \
        curl \
        vim \
        gnupg2 \
        software-properties-common \
        build-essential

# Get docker
RUN curl -fsSL https://download.docker.com/linux/$(. /etc/os-release; echo "$ID")/gpg > /tmp/dkey; apt-key add /tmp/dkey \
    && add-apt-repository \
    "deb [arch=amd64] https://download.docker.com/linux/$(. /etc/os-release; echo "$ID") \
    $(lsb_release -cs) \
    stable" \
    && apt-get update

# Install Docker
RUN apt-get -y install docker-ce
    # && rm -rf /var/lib/apt/lists/* \
    # && apt-get autoremove -y

# Get docker-compose
RUN curl -L https://github.com/docker/compose/releases/download/1.25.5/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose \
    && chmod 755 /usr/local/bin/docker-compose \
    && usermod -a -G sudo jenkins \
    && ln -sf /usr/local/bin/docker-compose /usr/bin/docker-compose

RUN echo "jenkins ALL=(ALL:ALL) NOPASSWD:ALL" >> /etc/sudoers \
    usermod -aG docker jenkins \
    gpasswd -a jenkins docker

# RUN usermod -aG docker jenkins
# RUN gpasswd -a jenkins docker
USER jenkins

VOLUME [ "/srv/jenkins/home" ]