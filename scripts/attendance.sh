#/bin/sh
# 勤怠記録をつけるスクリプト

DIR=${HOME}/Dropbox/attendance
TODAY=`date "+%Y/%m/%d"`
THIS_MONTH=`date "+%Y%m"`
FILE_PATH=${DIR}/${THIS_MONTH}.csv

saveAttendance(){

# grep -E ${TODAY} ${FILE_PATH}
# if [ $? -eq 0 ]; then
cat ${FILE_PATH} | while read line
do
    echo $numLine: $line 
    numLine=$((numLine + 1)) # 行数を1増やす
done
# else
#     cat ${FILE_PATH} | while read line
#     do
#         echo $numLine: $line # 出力
#         numLine=$((numLine + 1)) # 行数を1増やす
#     done
# fi
echo 'complete'

}

echo 'fucking hello hananana!!'
echo "today is ${TODAY}"

if [ -e ${FILE_PATH} ]; then
    saveAttendance
else
    touch ${FILE_PATH}
    saveAttendance
fi

