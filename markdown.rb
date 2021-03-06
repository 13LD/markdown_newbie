require 'octokit'
URL = "https://github.com/john-denisov/markdown_newbie"
PATH = File.join(File.dirname(__FILE__), 'file/README.md')

def markdown(url)
  parsed_url = url.slice(url.index(".com")..-1)
  system("curl https://raw.githubusercontent" + parsed_url + "/master/README.md > file/README.md")
end


def lang_prediction(parsed)
  lang, predict_response = [], ""
  parsed.each_with_index {|block, index|
    file_name = "file/block#{index}"
    open(file_name, 'w') do |f|
      f.puts block
    end
    line_count = `wc -l "#{file_name}"`.strip.split(' ')[0].to_i
    if line_count > 2
      echo = `guesslang -i file/block#{index}`
      predict_response << echo
    else
      predict_response << "guesslang.__main__ INFO The source code is written in 1 line"
    end
  }

  parsed_prediction = predict_response.split(/guesslang.__main__ INFO The source code is written in /)[1..-1].each_slice(1).to_a

  parsed_prediction.each do |t|
    lang << t.join(" ").split(/\n/).first.downcase!
  end
  lang

end

def update_readme(block_counter, lang)
  iter, new_data = 0,  ""
  lang.map!{|x|x.nil? ? "":x}
  File.open(PATH, 'r+').each do |line|
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
  File.open(PATH, "w") {|file| file.puts new_data }

end

def markdown_update
  block_counter, data, parsed = 0, "", []
  File.open(PATH, 'r+').each do |line|
    data << line
  end
  test = data.split(/```/)[1..-1].each_slice(1).to_a
  test.each do |t|
    block_counter += 1
    if block_counter % 2 == 1
      parsed << t.join(" ")

    end
  end


  lang = lang_prediction(parsed)
  update_readme(block_counter, lang)

end



#
# markdown(URL)
#
# if system("pip3 install guesslang")
#   markdown_update
# end
#
client = Octokit::Client.new :access_token => 'ce0ce7be4d9f63f59531c15ab5e3825d336b001e'

client.repos.each do |repo|
  puts repo.name
  puts repo.description

  # find the urls
  puts repo.rels[:html].href
  puts repo.rels[:git].href
  puts repo.rels[:clone].href
  puts repo.rels[:ssh].href
  puts "\n"
end

