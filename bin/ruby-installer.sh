#!/bin/bash

export RBENV_ROOT="${OPENSHIFT_DATA_DIR}.rbenv"
export RBENV_INIT="${OPENSHIFT_DATA_DIR}rbenv-init.sh"
export RUBY_VERSION="2.0.0-p353"

if [ ! -d "${RBENV_ROOT}" ] ; then

    curl https://raw.githubusercontent.com/fesplugas/rbenv-installer/master/bin/rbenv-installer | bash

    echo "gem: --no-rdoc --no-ri" > ${OPENSHIFT_DATA_DIR}.gemrc

    echo '
export RBENV_ROOT="${OPENSHIFT_DATA_DIR}.rbenv"

if [ -d "${RBENV_ROOT}" ]; then
  export PATH="${RBENV_ROOT}/bin:${PATH}"
  eval "$(rbenv init -)"
fi

alias gem="gem --config-file ${OPENSHIFT_DATA_DIR}.gemrc"
    ' > $RBENV_INIT

    source $RBENV_INIT

    rbenv install $RUBY_VERSION
    rbenv global $RUBY_VERSION

    gem install bundler
fi
