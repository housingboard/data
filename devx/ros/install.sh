#!/bin/bash

cd "$(dirname $0)"

echo "Linking ..."

echo "#!/bin/bash
cd $PWD
exec $@" > /usr/local/bin/a5os
chmod +x  /usr/local/bin/a5os

#ln -sfT $PWD/a5os /usr/local/bin/a5os


