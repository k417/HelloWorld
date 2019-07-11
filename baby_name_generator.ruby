#name combination criteria: (for future iterations)
#name endings (y, ie)
#syllables
#middle names maybe 1,2,3 syllables
#initials dont make a bad word
#alliteration
#consonant matching with vowel matching

vowel_pattern = /[aeiouy]/ #sometimes...or...always... y...
consonant_pattern = /[bcdfghjklmnpqrstvwx]/ #...never y...

##input variables
surname = ""
name_idea_list = []
user_has_more_names = true

##processing
print "What will be the baby's last name? "
surname = STDIN.gets.chomp

# def get_vowel_pattern(name)
#   pattern = /[aeiouy]/ #sometimes...or...always... y...
#   name_vowel_string = ""
#   vowels_from_name = name.downcase.scan(pattern).sort
#   ##puts vowels_from_name
#   vowels_from_name.each do |vowel|
#     name_vowel_string += vowel
#   end
#   name_vowel_string.squeeze! #remove duplicate letters (maybe later utilize reoccurance as favorable)
#   /[#{name_vowel_string}]/
# end

def build_subpattern(name, pattern)
  subpattern_string = ""
  letters_from_name = name.downcase.scan(pattern).sort
  letters_from_name.each do |letter|
    subpattern_string += letter
  end
  subpattern_string.squeeze!
  /[#{subpattern_string}]/
end

surname_vowel_pattern = build_subpattern(surname, vowel_pattern)
surname_consonant_pattern = build_subpattern(surname, consonant_pattern)

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

def create_sorted_frequency_hash(list, pattern)
  frequency_hash = Hash.new(0)
  list.each do |name|
    frequency_hash[name] = name.downcase.scan(pattern).count
  end
  frequency_hash = frequency_hash.sort_by {|_key, value| value}.reverse.to_h #sort by the frequency of vowels occuring...
end

puts name_vowel_frequency = create_sorted_frequency_hash(name_idea_list, surname_vowel_pattern)
#name_vowel_frequency.each { |name,freq| puts "#{name} #{surname} (: #{freq})" }
puts name_consonant_frequency = create_sorted_frequency_hash(name_idea_list, surname_consonant_pattern)
#maybe remove any results that have 0 frequency?
#some how combine lists or whatever
