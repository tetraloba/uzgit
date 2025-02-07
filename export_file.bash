#!/bin/bash

EXPORT_DIR=all_versions

REPO=research_B

FILE_BASE_PATH=21T314
FILE_EXT=docx

mkdir $EXPORT_DIR
cd $REPO
cnt=`git log --oneline ${FILE_BASE_PATH}.${FILE_EXT} | wc -l`
echo $cnt
git log --format="%H" -- ${FILE_BASE_PATH}.${FILE_EXT} | while read commit; do
    git show "$commit:${FILE_BASE_PATH}.${FILE_EXT}" > "../all_versions/${FILE_BASE_PATH}_`printf '%02d' ${cnt}`.${FILE_EXT}"
    cnt=$(($cnt - 1))
done

