# 問題：
#     VERTEXグループは勉強熱心なエンジニアに奨励金を出すために
#     各メンバーが学習に費やした金額を可視化しようとしています。

#     メンバーそれぞれの学習費用を計算し
#     値が高い人から順に名前と金額を出力するプログラムを作成してください。
#
#     入力は、data00*.txt(* = 1~3)ファイルから与えられます。
#     ・1 行目に、人数 N が文字列型の整数で与えられます。
#     ・2 行目に、半角英文字で構成される文字列が N 個スペース区切りで与えられます。
#     ・3 行目に、全メンバーが学習した回数 M が文字列型の整数で与えられます。
#     ・4 行目から続く M 行には、 学習した人の名前を表す半角英文字で構成される文字列 と
#     　学習コストを表す文字列型の整数 がこの順にスペース区切りで与えられます。
#     ・入力は合計で M + 3 行となり、入力値最終行の末尾に改行が１つ入ります。

# 解答：
1.upto 3 do |t|
  puts "例#{t}の答え"
  File.open("data00#{t}.txt", "r"){ |f|
    # ここにプログラムを記述してください。

    # 読み込んだ内容をx[行数-1]で管理できるように取得
    x = f.readlines
    x.each do |x| # \nを消去するためchomp!
      x.chomp!
    end

    # resultsハッシュを作成したいな〜。resultsは{name => value}の形式
    name = x[1].split(" ") # 2行目、つまり人の名前を配列にして取得
    value = [] # resultsハッシュ用に空のvalue配列を作成
    n = x[0].to_i #人数nを取得
    n.times do # 人数分、０をvalueに追加
      value << 0
    end
    ary = [name, value].transpose # nameとvalueをあわせた配列の作成。resultsのもと
    results = Hash[*ary.flatten] # resultsハッシュができた

    # 名前と値段の文を配列に
    m = x[2].to_i #学習回数mを取得
    ary = x[3, m]
    name_price = ary.map! {|a| a.split(" ")} # 名前と学習コストの配列を作成

    # resulutsにname_priceのpriceを足してく
    name_price.each do |name, price|
      results[name] += price.to_i
    end

    #resultsハッシュをvalueでソートし、降順にした後、ハッシュ化
    p results.sort_by{|k, v| v }.reverse.to_h
  }
end

# data001で期待する出力
# {"yamaguchi"=>1500, "maeda"=>1000}
# data002で期待する出力
# {"A"=>3000, "C"=>2000, "B"=>1000}
# data003で期待する出力
# {"yamaguchi"=>13500, "asano"=>13000, "maeda"=>10000, "fujita"=>8000, "nishino"=>7000, "takahashi"=>6000, "harada"=>5500, "kobira"=>5000, "nakayashiki"=>2000, "ishikawa"=>1500, "sugimoto"=>1000}
