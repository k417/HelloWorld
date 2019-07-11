file = "bad_initials.txt"
@initials_list = []

#get the list from the file and store in an array
File.readlines(file).each do |line|
  @initials_list += line.split
end

#list clean up
@initials_list.sort! #sort alphabetically
@initials_list.uniq! #remove duplicate entries

File.delete(file) if File.exist?(file) #remove the file before inserting new cleaned up list

#insert new cleaned up list (creates new file)
File.open(file, "w+") do |f|
  @initials_list.each { |init| f.puts(init) }
end
