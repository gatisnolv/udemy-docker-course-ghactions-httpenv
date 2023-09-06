#!/bin/bash
for i in {187..227}
do
   gh api \
  --method DELETE \
  --silent \
  -H "Accept: application/vnd.github+json" \
  -H "X-GitHub-Api-Version: 2022-11-28" \
  /repos/gatisnolv/udemy-docker-course-ghactions-httpenv/actions/caches/$i
done