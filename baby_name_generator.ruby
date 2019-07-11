#input variables
last_name = ""
name_idea_list = []
user_has_more_names = true

#processing
print "What will be the baby's last name? "
last_name = STDIN.gets.chomp

while name_idea_list.length < 2
  print "Add a baby name: "
  name_idea_list.push(STDIN.gets.chomp)
end


while user_has_more_names
  print "Add another baby name, OR press enter to get your results: "
  input = STDIN.gets.chomp
  user_has_more_names = input!=""
  if user_has_more_names
    name_idea_list.push(input)
  end
end

puts ""
p name_idea_list
