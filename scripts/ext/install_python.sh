#!/usr/bin/env bash
USER_INSTALL=vagrant

set -e
[ -n "$PYENV_DEBUG" ] && set -x

if [ -z "$PYENV_ROOT" ]; then
  PYENV_ROOT="${USER_INSTALL}/.pyenv"
fi

if [ -d "${PYENV_ROOT}" ]; then
    echo ": Can not proceed with installation. Kindly remove '.pyenv' from ${USER_INSTALL} first.";
    exit 1
fi


checkout() {
  [ -d "$2" ] || git clone --depth 1 "$1" "$2" || failed_checkout "$1"
}

failed_checkout() {
  echo "Failed to git clone $1"
  exit -1
}

if ! command -v git 1>/dev/null 2>&1; then
  echo "pyenv: Git is not installed, can't continue." >&2
  exit 1
fi

GITHUB="https://github.com"

checkout "${GITHUB}/pyenv/pyenv.git"            "${PYENV_ROOT}"

echo "Adding startup script for ${USER} into .bashrc file."
echo "export PATH=\"\home\${PYENV_ROOT}/bin:\$PATH\"" >> /home/$USER_INSTALL/.bashrc
echo "eval \"\$(pyenv init -)\"" >> /home/$USER_INSTALL/.bashrc
echo "eval \"\$(pyenv virtualenv-init -)\"" >> /home/$USER_INSTALL/.bashrc
