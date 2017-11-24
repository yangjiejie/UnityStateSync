#!/bin/bash


\cp ../../../data/data.code.php.client/* protocol/

chmod +x composer.phar
./composer.phar dump-autoload


php client.php
