#! /bin/sh

npm --production=false install

npm install

npm run start

tail -f /dev/null

#EOF
