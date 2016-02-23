#ruby

require 'csv'
require 'fileutils'

def formattedToday()
  now = Time.now
  now.year.to_s + '/' + now.month.to_s + '/' + now.day.to_s
end

def formattedNow()
  now = Time.now
  now.hour.to_s + ':' + now.min.to_s
end

def formattedGoHomeTime()
  now = Time.now
  goHomeHour = now.hour + 9
  goHomeHour.to_s + ':' + now.min.to_s
end

def overwrite(path, csv)
  File.open(path, 'w') do |file|
    csv.each do |row|
       file.puts row[0] + ',' + row[1] + ',' + row[2]
    end
  end
end

def existToday(csv)
  now = Time.now
  dates = csv.map{|row| row[0]}
  flag = false
  dates.each do |date|
    year =  date.split('/')[0].to_i
    month =  date.split('/')[1].to_i
    day =  date.split('/')[2].to_i
    if year == now.year && month == now.month && day == now.day then
      flag = true
    end
  end
  return flag
end

def todayHelloTime(csv)
  now = Time.now
  csv.length.times do |i|
    date = csv[i][0]
    year =  date.split('/')[0].to_i
    month =  date.split('/')[1].to_i
    day =  date.split('/')[2].to_i
    if year == now.year && month == now.month && day == now.day then
      return csv[i][1]
    end
  end
end

def printInfo(csv)

  totalHour = 0
  totalSec = 0
  csv.each do |row|
    helloStrings = row[1].split(':')
    byeStrings = row[2].split(':')
    tempHello = Time.local(2000,1,1,helloStrings[0].to_i,helloStrings[1].to_i,0)
    tempBye = Time.local(2000,1,1,byeStrings[0].to_i,byeStrings[1].to_i,0)
    totalSec += tempBye - tempHello - 60 * 60
    totalHour = totalSec/60/60
  end

  baseTime = 60 * 60 * 8 * csv.length
  diff = (totalSec - baseTime) / 60 / 60

  back = csv[csv.length - 1]
  print "今月働いてる時間: " + totalHour.to_s + "\n出勤日数: " + csv.length.to_s  + "\n残業時間: " + diff.to_s + "\n今日の出社時間" + back[1] + "\n今日の退社予定時間" + back[2]
end

def logAttendance(path, flag)
  csv = CSV.read(path)
  if flag == 'hello' then
    if existToday(csv) then
      csv.delete_at(csv.length - 1)
    end
    csv.push([formattedToday(), formattedNow(), formattedGoHomeTime()])
    overwrite(path, csv)
  elsif flag == 'bye' then
    t = todayHelloTime(csv)
    if existToday(csv) then
      csv.delete_at(csv.length - 1)
    end
    csv.push([formattedToday(), t, formattedNow()])
    overwrite(path, csv)
  end
  printInfo(csv)
end

dir = ENV['HOME'] + '/Dropbox/attendance/'
file_name = now.year.to_s + sprintf("%02d", now.month) + '.csv'
file_path = dir + file_name
if !File.exist?(file_path) then
  FileUtils.touch(file_path)
end
logAttendance(file_path, ARGV[0])
