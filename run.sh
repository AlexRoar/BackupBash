#!/usr/bin/env bash

# ./run.sh ~/repo cpp backup backup.tar.gz
# ./run.sh <абсолютный путь> <расширение> <название папки для бекапа> <имя архива с бекапом>

copy_dir_files() { # (1:directory, 2:targetDirectory, 3:fileExtension
 # echo "$1"
 local files=`ls -1a $1`
 IFS='
 '
 for var in $files
 do
  if [ "$var" == "." ]; then
   continue
  fi
  if [ "$var" == ".." ]; then
   continue
  fi
  echo $var

  if [ -d "$var" ]; then
   walk_dir "$(pwd)/$1/$var"
  fi
 done
}

copy_dir_files "$1" "$(pwd)/$3" "$2"