#!/bin/bash
set -x

APP_ENV=${APP_ENV:-dev}
curl_auth=""
if [ ! -z "$REPOSITORY_USERNAME" -a ! -z "$REPOSITORY_PASSWORD" ]; then
 curl_auth="-u $REPOSITORY_USERNAME:$REPOSITORY_PASSWORD"
fi

if [ ! -f requirements ] ;then
   exit 1
fi
[ -d build ] && rm -rf build
mkdir -p build

grep -v '^#' requirements | awk  ' !  /^#/ { print $1, $2 } ' | while read name url ; do
  if [ -z "$name" -o -z "$url" ]; then
   continue
  fi
  filename=${name}-$(basename $url)

  case "$url" in
    https://github.com*) curl_args="" ; tar_args="--strip=1" ;;
    *) curl_args=$curl_auth ; tar_args="" ;;
  esac

  echo "# Download and extract requirements $url in build/${name}"
  ( cd build
  mkdir -p ${name}
  curl -LS $curl_args -o $filename $url && \
    tar -zxvf $filename -C ${name} ${tar_args}
#     --strip=1
## to remove the top level github archive : --strip=1
  echo "# Extracted in build/$name"
  )

  if [ -d "$APP_ENV/${name}" ]; then
  echo "# Generate conf $APP_ENV/${name}"
  find $APP_ENV/${name} -type f

  ( cd ${APP_ENV}/${name} && find . -type f -print0 | tar cf - --null -T - ) | ( cd build/${name} && tar xvf -)
  fi

  echo "# clean $filename"
  rm -rf build/$filename
done
