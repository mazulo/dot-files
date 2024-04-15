#!/usr/bin/env zsh

# result=${PWD##*/}
# result=${result:-/}

# to print to stdout more robust than echo for unusual names (consider a directory named -e or -n)
# printf '%s\n' "${PWD##*/}" 

# to print to stdout, quoted for use as shell input useful to make hidden characters readable.
# printf '%q\n' "${PWD##*/}" 

nvm use stable
