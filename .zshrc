# Language specification
export LANG=C

# load special environment variables

if [ -f ${HOME}/.env ]; then
  . ${HOME}/.env
fi

# Commands Alias
alias "ssh=ssh -A"

# launch ssh-agent
ssh_agent_alias="${HOME}/.ssh/agent"
if [ -S "${SSH_AUTH_SOCK}" ]; then
  case ${SSH_AUTH_SOCK} in
    /var/*/agent.[0-9]*)
      ln -snf "${SSH_AUTH_SOCK}" $ssh_agent_alias && export SSH_AUTH_SOCK=$ssh_agent_alias
    ;;
    /private/*/Listeners)
      eval $(ssh-agent -s)                      >/dev/null 2>&1
      ssh-add ${HOME}/.ssh/IdentityFiles/id_rsa >/dev/null 2>&1
    ;;
  esac
elif [ -S "${ssh_agent_alias}" ]; then
  export SSH_AUTH_SOCK=$ssh_agent_alias
fi

# history
export HISTSIZE=100000
export HISTIGNORE='history:fg*:bg*:pwd'

# set BREW_HOME
BREW_HOME=$(brew --prefix)

# enable zsh completions
autoload -Uz compinit
compinit

# zsh-completion
fpath=(/usr/local/share/zsh-completions $fpath)

# aws-completion
if [ -e ${BREW_HOME}/awscli ]; then
  . ${BREW_HOME}/awscli/share/zsh/site-functions/aws_zsh_completer.sh
fi

# Use coreutils by brew
if [ -e $(brew --prefix coreutils) ]; then
  export PATH="$(brew --prefix coreutils)/libexec/gnubin":$PATH
fi

# goenv
if [ -e $(brew --prefix goenv) ]; then
  export GOENVGOROOT=$(brew --prefix goenv)
  eval "$(goenv init -)"
fi

# kubectl
if [ -e $(brew --prefix kubectl) ]; then
  . <(kubectl completion zsh)
fi

# python virtualenvwrapper
if [ -e ${BREW_HOME}/bin/virtualenvwrapper_lazy.sh ]; then
  . ${BREW_HOME}/bin/virtualenvwrapper_lazy.sh
fi

# anyenv
if [ -e ${BREW_HOME}/bin/anyenv ]; then
  eval "$(${BREW_HOME}/bin/anyenv init -)"
  export PATH="$HOME/.anyenv/bin:$PATH"
fi

# gcloud
if [ -e "$(brew --prefix)/Caskroom/google-cloud-sdk" ]; then
  prefix="$(brew --prefix)/Caskroom/google-cloud-sdk/latest/google-cloud-sdk"
  export PATH="${prefix}/bin":$PATH
  source ${prefix}/completion.zsh.inc
fi

# asdf
if [ -e $(brew --prefix asdf) ]; then
  . $(brew --prefix asdf)/asdf.sh
fi

# Commands Alias in brew
alias "ls=ls --color=auto"
alias "ll=ls -lA --color=auto"
