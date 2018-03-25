
URL = "https://github.com/DenisUA/markdown_newbie"

def markdown(url)
  parsed_url = url.slice(url.index(".com")..-1)
  system("curl https://raw.githubusercontent" + parsed_url + "/master/README.md > file/README.md")
end

def parse_blocks
  path = File.join(File.dirname(__FILE__), 'file/README.md')
  block_counter, iter, data, predict_response, new_data, parsed, lang = 0, 0, "", "", "", [], []
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
    predict_response << dat
  }

  parsed_prediction = predict_response.split(/guesslang.__main__ INFO The source code is written in /)[1..-1].each_slice(1).to_a

  parsed_prediction.each do |t|
    lang << t.join(" ").split(/\n/).first.downcase!
  end


  File.open(path, 'r+').each do |line|
    if line.include? "```" and block_counter % 2 == 0
      new_data << "```" + lang[iter] + "\n"
      iter += 1
      block_counter -= 1
    elsif line.include? "```" and block_counter % 2 == 1
      new_data << line
      block_counter -= 1
    else
      new_data << line
    end
  end
  File.open(path, "w") {|file| file.puts new_data }
end


markdown(URL)

if system("pip3 install guesslang")
  parse_blocks
end