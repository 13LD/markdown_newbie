
URL = "https://github.com/DenisUA/markdown_newbie"

def markdown(url)
  parsed_url = url.slice(url.index(".com")..-1)
  system("curl https://raw.githubusercontent" + parsed_url + "/master/README.md > file/README.md")
end

def parse_file
  path = File.join(File.dirname(__FILE__), 'file/README.md')
  block_counter, data, predict_response, parsed = 0,  "", "", []
  File.open(path, 'r+').each do |line|
    data << line
  end
  test = data.split(/```/)[1..-1].each_slice(1).to_a
  test.each do |t|
    block_counter += 1
    if block_counter % 2 == 1
      parsed << t.join(" ")
    end
  end

  parsed.each_with_index {|block, index|
    file_name = "file/block#{index}"
    open(file_name, 'w') do |f|
      f.puts block
    end
    dat = `guesslang -i file/block#{index}`
    p dat
    predict_response << dat
  }

  parsed_prediction = predict_response.split(/guesslang.__main__ INFO The source code is written in /)[1..-1].each_slice(1).to_a
  parsed_prediction.each do |t|
    p t.join("").split(/\n/).first.downcase!
  end

end



markdown(URL)
system("pip3 install guesslang")
parse_file