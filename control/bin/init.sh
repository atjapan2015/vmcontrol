#!/bin/bash

# usage
# bash -c "$(curl -L "https://drive.google.com/uc?export=download&id=1fL6hKVmplp6CEXUursuButCEI7VEzDUX")"

echo "Setup vbox"

curl -L -o ~/.kube/config "https://drive.google.com/uc?export=download&id=1WzKQlRevLmnavxRR6FeDpwCta4sNJczp"

echo "Config download for vbox is done."
