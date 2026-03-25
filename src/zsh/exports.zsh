# Environment variables

export EDITOR="nvim"
export WHOAMI=$(whoami)

# macOS-specific: Colima Docker socket
if [[ "$OSTYPE" == "darwin"* ]]; then
  export DOCKER_HOST="unix://${HOME}/.colima/default/docker.sock"
fi

# QMK firmware
export QMK_HOME="$HOME/src/qmk_firmware"
