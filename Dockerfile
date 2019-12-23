# Dotfiles test environment
FROM ubuntu:latest

LABEL Description="This image is used to test my dotfiles installation"

# Initialize
RUN apt-get update
RUN apt-get install -y make zsh vim neovim git curl tmux
RUN apt-get install -y language-pack-en-base language-pack-en
RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

# Create test user and add to sudoers
RUN useradd -m -s /bin/zsh tester
RUN usermod -aG sudo tester
RUN echo "tester   ALL=(ALL:ALL) NOPASSWD: ALL" > /etc/sudoers

# Add dotfiles and chown
ADD . /home/tester/dotfiles
RUN chown -R tester:tester /home/tester

# Switch testuser
USER tester
ENV HOME /home/tester

# Change working directory
WORKDIR /home/tester/dotfiles

CMD ["/bin/bash"]
