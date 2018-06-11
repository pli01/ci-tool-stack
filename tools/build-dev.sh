#!/bin/bash
set -x

APP_ENV=${APP_ENV:-dev}
curl_auth=""
if [ ! -z "$REPOSITORY_USERNAME" -a ! -z "$REPOSITORY_PASSWORD" ]; then
 curl_auth="-u $REPOSITORY_USERNAME:$REPOSITORY_PASSWORD"
fi

requirements=requirements-dev
if [ ! -f $requirements ] ;then
   exit 1
fi
[ -d build ] || mkdir -p build

grep -v '^#' $requirements | awk  ' !  /^#/ { print $1, $2 } ' | while read name url ; do
  if [ -z "$name" -o -z "$url" ]; then
   continue
  fi
#  case "$url" in
#    https://github.com*) curl_args="" ; tar_args="--strip=1" ;;
#    *) curl_args=$curl_auth ; tar_args="" ;;
#  esac

  echo "# Clone requirements $url in build/${name}"
  [ -d build/$name ] || ( cd build && git clone $url ${name} ) && ( cd build/$name && git pull --rebase )
  ( cd build/$name ; git config --local --replace-all user.name pli01
  git config --local --replace-all user.email pli01@github.com
  git config --local --replace-all credential.username pli01
  )

  echo "# Extracted in build/$name"

  if [ -d "$APP_ENV/${name}" ]; then
    echo "# Generate conf $APP_ENV/${name}"
    find $APP_ENV/${name} -type f

    ( cd ${APP_ENV}/${name} && find . -type f -print0 | tar cf - --null -T - ) | ( cd build/${name} && tar xvf -)
  fi

#  echo "# clean $filename"
#  rm -rf build/$filename
done
