#!/bin/bash

prod_url_hooks="git@clubs.iiit.ac.in:hooks.git"

# Check if exactly one argument is provided
if [ $# -ne 1 ]; then
    echo "Usage: $0 [setup|deploy]"
    exit 1
fi

case "$1" in
    setup)
      if ! git remote | grep -q "^prod$"; then
        git remote add prod "$prod_url_hooks"
        echo "Added prod remote for services: $prod_url_hooks"
      else
        echo "Prod remote already exists for services."
      fi
      ;;
    deploy)
      git push prod master:master
      ;;
    *)
      echo "Error: The parameter must be 'setup' or 'deploy'"
      exit 1
      ;;
esac
