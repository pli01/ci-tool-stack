#!/bin/bash
export LC_ALL=C
export PATH=/root/.local/bin:$PATH
cd /opt 
for i in job-*; do 
  if [ -d "$i" -o -f "$i" ] ; then
    echo "# Build job $i"
    make test JJB_JOBS=$i || exit 1
    echo "# Success job $i"
  else
    echo "$i error"
   exit 1
  fi
done
