#!/bin/bash

mpc update --wait;
echo $1 | cut -d'/' -f5- | mpc insert
mpc next
