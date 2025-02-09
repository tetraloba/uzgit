#!/bin/bash
set -e

EXPORT_DIR=all_versions

REPO=research_B

FILE_PATH=./thesis/graduate/21T314.docx
FILE_BASE_PATH=./thesis/graduate/21T314
FILE_BASE=21T314
FILE_EXT=docx

mkdir $EXPORT_DIR
cd $REPO
cnt=`git log --oneline ${FILE_PATH} | wc -l`
echo $cnt # debug
git log --format="%H" -- ${FILE_PATH} | while read commit; do
    git show "$commit:${FILE_PATH}" > "../all_versions/${FILE_BASE}_`printf '%02d' ${cnt}`.${FILE_EXT}"
    cnt=$(($cnt - 1))
done

