require_relative "baby_name_generator"

##processing
print "What will be the baby's last name? "
surname = STDIN.gets.chomp.capitalize
#surname_vowel_pattern = build_subpattern(surname, vowel_pattern)
#surname_consonant_pattern = build_subpattern(surname, consonant_pattern)
surname_alphabet_pattern = build_subpattern(surname, alphabet_pattern)

# dont feel like dealing with this right now so commenting it out
while name_idea_list.length < 2
  print "Add a baby name: "
  name_idea_list.push(STDIN.gets.chomp.capitalize)
end
while user_has_more_names
  print "Add another baby name, OR press enter to get your results: "
  input = STDIN.gets.chomp
  user_has_more_names = input!=""
  if user_has_more_names
    name_idea_list.push(input.capitalize)
  end
end
puts ""

#puts name_vowel_frequency = create_sorted_frequency_hash(name_idea_list, surname_vowel_pattern)
#puts name_consonant_frequency = create_sorted_frequency_hash(name_idea_list, surname_consonant_pattern)
puts name_alphabet_frequency = create_sorted_frequency_hash(name_idea_list, surname_alphabet_pattern)

get_name_combinations(name_alphabet_frequency).each { |combo|
  full_name ="#{combo} #{surname}" #todo: full_name.get_initials
  initials = get_initials(full_name) #todo: initials.are_bad
  unless initials_are_bad(initials) then puts full_name else puts "#{full_name} ***#{initials} are risky initials***" end
}
