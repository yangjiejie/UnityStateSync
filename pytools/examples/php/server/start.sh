#!/bin/bash


\cp ../../../data/data.code.php.server/* protocol/


chmod +x composer.phar
./composer.phar dump-autoload


php server.php
