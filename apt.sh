# !/bin/bash
sudo apt-get update
sudo apt-get upgrade
sudo apt-get install $(grep -vE "^\s*#" apt-packages.txt  | tr "\n" " ")
