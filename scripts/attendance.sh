#/bin/sh
# 勤怠記録をつけるスクリプト

DIR=${HOME}/Dropbox/attendance
TODAY=`date "+%Y/%m/%d"`
THIS_MONTH=`date "+%Y%m"`
FILE_PATH=${DIR}/${THIS_MONTH}.csv

saveAttendance(){

grep -E ${TODAY} ${FILE_PATH}
if [ $? -eq 0 ]; then
    echo 'hoge'
else
    echo 'fuga'
fi
echo 'complete'

}

echo 'fucking hello hananana!!'
echo "today is ${TODAY}"

if [ -e ${FILE_PATH} ]; then
    saveAttendance
else
    touch ${FILE_PATH}
    echo 'nai'
fi

