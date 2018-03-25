URL = "https://github.com/DenisUA/markdown_newbie"

def markdown(url)
  parsed_url = url.slice(url.index(".com")..-1)
  exec("curl https://raw.githubusercontent" + parsed_url + "/master/README.md > file/README.md")
end


markdown(URL)
