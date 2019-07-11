#input variables
last_name = ""
name_idea_list = []
user_has_more_names = true

#processing
print "What is your last name? "
last_name = STDIN.gets.chomp

print "What is your first choice? "
name_idea_list.push(STDIN.gets.chomp)

while user_has_more_names
  print "Add another name or press enter to get your results: "
  input = STDIN.gets.chomp
  user_has_more_names = input!=""
  name_idea_list.push(input)
end

puts name_idea_list
