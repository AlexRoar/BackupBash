#!/bin/bash

# ./run.sh ~/repo cpp backup backup.tar.gz
# ./run.sh 1:<абсолютный путь> 2:<расширение> 3:<название папки для бекапа> 4:<имя архива с бекапом>

copy_dir_files() { # (1:directory, 2:targetDirectory, 3:fileExtension
  # echo "$1"
  local files
  files=$(ls -1a $1)
  IFS='
 '
  for var in $files; do
    if [ "$var" == "." ]; then
      continue
    fi
    if [ "$var" == ".." ]; then
      continue
    fi

    if [ -d "$1/$var" ]; then
      mkdir "$2/$var"
      copy_dir_files "$1/$var" "$2/$var" "$3"
    else
      if [[ $var == *.$3 ]]; then
        echo "From $1/$var to $2/$var"
      fi
    fi
  done
}

if [ -d "$3" ]; then
  rm -rf "$3"
  mkdir "$3"
else
  mkdir "$3"
fi

copy_dir_files "$1" "$(pwd)/$3" "$2"
