file = "bad_initials.txt"
@initial_list = []

File.readlines(file).each do |line|
  @initial_list += line.split
end

File.delete(file) if File.exist?(file)

@initial_list.sort! #sort alphabetically
@initial_list = @initial_list & @initial_list #remove duplicates

File.open(file, "w+") do |f|
  @initial_list.each { |init| f.puts(init) }
end
