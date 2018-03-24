
def parse_file
  path = File.join(File.dirname(__FILE__), 'file/README.md')
  data = ""
  File.open(path, 'r+').each do |line|
    data << line
  end
  parsed = data.slice(data.index("```")..-1)
  p parsed
end

parse_file