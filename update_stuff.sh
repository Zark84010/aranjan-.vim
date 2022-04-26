#!/bin/bash

curr_path=$(pwd)
cd pack
categories=$(ls -d */)
for cat in $categories
do
  cd $cat
  direcs=$(ls -d */) # start, unused etc.
  for direc in $direcs
  do
    cd $direc
    plugs=$(ls -d */)
    for plug in $plugs
    do
      cd $plug
      echo "Starting update plugin $plug..."
      git pull origin master || git pull origin main
      if [ $? ]; then
        echo "Plugin $plug successfully updated."
      else
        echo "An error occured while updating plugin $plug. Tough luck."
      fi
      echo ""
      cd ..
    done
    cd ..
  done
  cd ..
done
cd $curr_path

