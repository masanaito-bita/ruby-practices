# Dateクラスを呼び込む
require 'date'

# コマンドラインのオプションを取り扱うためのライブラリ
require 'optparse'

# コマンドオプション
option = {}
OptionParser.new do |opt|
  opt.on('-m [month]'){|v| option[:m] = v}
  opt.on('-y [year]'){|v| option[:y] = v}
  opt.parse!(ARGV)
end

today = Date.today
month = option[:m] ? option[:m].to_i : today.month
year = option[:y] ? option[:y].to_i : today.year

def cal(month, year)
  # 今日の月と西暦を取得し上部に表示
  head = "#{month}月 #{year}"

  # 今月1日の曜日
  week = Date.new(year, month, 1).wday # 0~6, 曜日

  #今月末日 -1と表記することで取得可能
  lastday = Date.new(year, month, -1).day # 31

  # %wは配列を作る表記
  weeks = %w(日 月 火 水 木 金 土)

  # 中央に揃えてる
  puts head.center(20)
  # weekを横並びにして空白入れてる
  puts weeks.join(" ")
  print "   " * week

  (1..lastday).each do |date|
    # 日時の表示位置を整形
    print date.to_s.rjust(2) + " "

    # 一週間ごとに改行を入れる
    week = week + 1
    if week % 7 == 0
      puts
    end
  end
end

cal(month, year)
puts
