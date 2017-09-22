#!/bin/bash


erl -noshell -s make all -s init stop


erl -pa ebin +P 1024000 -smp enable -s server
