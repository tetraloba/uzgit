#!/bin/bash
set -e

EXPORT_DIR=all_versions

REPO=research_B

FILE_NAME=thesis.docx

TEMP_REPO_DIR=tmp_dir_uzgit

rm -r ${TEMP_REPO_DIR}
mkdir ${TEMP_REPO_DIR}
cd ${TEMP_REPO_DIR}
git init
ls ../${EXPORT_DIR} | while read NEW_FILE; do
    cp ../${EXPORT_DIR}/${NEW_FILE} ${FILE_NAME}
    bash ../uzgit_add.bash ${FILE_NAME}
    git commit -m ${NEW_FILE}
    du ./.git -d 0 >> size_log.txt
done

