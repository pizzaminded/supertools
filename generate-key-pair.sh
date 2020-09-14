#!/usr/bin/env bash
# generate-key-pair.sh
# author: pizzaminded <mikolajczajkowsky@gmail.com>
# license: MIT


printf "generate-key-pair v1.0\n"

#see https://coderwall.com/p/4zux3a/random-string-generator-bash
#@TODO: provide an additional parameter to define which command should be used for random passphrases
RANDOM_PASSWORD=$(cat /dev/random | LC_CTYPE=C tr -dc "[:alpha:]" | head -c 24)

printf "Generated passphrase\n"

openssl genrsa -passout pass:${RANDOM_PASSWORD} -aes256 -out private.pem 3072
openssl rsa -passin pass:${RANDOM_PASSWORD} -pubout -in private.pem -out public.pem


printf "Done.\n";
printf "Passphrase: ${RANDOM_PASSWORD}\n"
