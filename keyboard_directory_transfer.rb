# macのキーボードアプリのユーザー辞書のエクスポートファイル(xml)を入力。
# gboardのユーザー辞書のインポートファイルを出力

require 'nokogiri'

file_path = ARGV[0]


sample_data = File.open(file_path)
parsed_info = Nokogiri::XML(sample_data)
list = parsed_info.xpath('//array/dict')

text = ""

list.each do |o|
	# nokogiriのインターフェースがよくわからないので、無理やり取り出す
	phrase = o.children[3].children.to_s
	shortcut = o.children[7].children.to_s

	text << "#{shortcut}\t#{phrase}\t名詞\n"
end

file = File.new("dictionary.txt","w")
file.write(text)
file.close

pp text