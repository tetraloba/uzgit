#!/bin/bash

EXPORT_DIR=all_versions

REPO=research_B

FILE_BASE_PATH=21T314
FILE_EXT=docx

TEMP_REPO_DIR=tmp_dir

mkdir ${TEMP_REPO_DIR}
cd ${TEMP_REPO_DIR}
git init
ls ../${EXPORT_DIR} | while read NEW_FILE; do
    cp ../${EXPORT_DIR}/${NEW_FILE} ${FILE_BASE_PATH}.${FILE_EXT}
    git add ${FILE_BASE_PATH}.${FILE_EXT}
    git commit -m ${NEW_FILE}
    du . -d 0 >> size_log.txt
done

