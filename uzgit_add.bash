FILE_PATH=$1
rm -r ${FILE_PATH}_unziped_
unzip $FILE_PATH -d ${FILE_PATH}_unziped_ >> ./unzip.log
git add ${FILE_PATH}_unziped_

