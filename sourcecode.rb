def filename(name)
  puts "Name of currently executed file: #{name}"
end

def displayfile(filename)
  puts "Source code of file:"
  puts File.read(filename)
end

filename(__FILE__)
displayfile(__FILE__)