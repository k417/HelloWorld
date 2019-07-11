#name combination criteria: (for future iterations)
#name endings (y, ie)
#syllables
#middle names maybe 1,2,3 syllables
#initials dont make a bad word
#alliteration
#consonant matching with vowel matching

vowel_pattern = /[aeiouy]/ #sometimes...or...always... y...
consonant_pattern = /[bcdfghjklmnpqrstvwx]/ #...never y...
alphabet_pattern =/[abcdefghijklmnopqrstuvwxyz]/

##input variables
surname = ""
name_idea_list = []
user_has_more_names = true

##processing
print "What will be the baby's last name? "
surname = STDIN.gets.chomp.capitalize

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

def create_sorted_frequency_hash(list, pattern)
  frequency_hash = Hash.new(0)
  list.each do |name|
    frequency_hash[name] = name.downcase.scan(pattern).count
  end
  frequency_hash = frequency_hash.sort_by {|_key, value| value}.reverse.to_h #sort by the frequency of vowels occuring...
end

#puts name_vowel_frequency = create_sorted_frequency_hash(name_idea_list, surname_vowel_pattern)
#puts name_consonant_frequency = create_sorted_frequency_hash(name_idea_list, surname_consonant_pattern)
puts name_alphabet_frequency = create_sorted_frequency_hash(name_idea_list, surname_alphabet_pattern)



def get_name_combinations(frequency_hash)
  combinations = []
  frequency_hash.each { |first, ffreq|
    frequency_hash.each { |middle, mfreq|
      unless first.eql? middle then combinations.push("#{first} #{middle}") end
    }
  }
  combinations
end

def initials_are_bad(initials)
  if initials.eql? "ASS" then true else false end
end


get_name_combinations(name_alphabet_frequency).each { |combo|
  full_name ="#{combo} #{surname}"
  initials = full_name.split.map(&:chr).join
  unless initials_are_bad(initials) then puts full_name else puts "#{initials} is a risky initial combination..." end
}



#just print all the possibilities
# name_idea_list.permutation(2).to_a.each { |combination| puts "#{combination[0]} #{combination[1]} #{surname}"}


#maybe remove any results that have 0 frequency?
#some how combine lists or whatever (this is the full alphabet....duh)
