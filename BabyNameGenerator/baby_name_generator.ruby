#name combination criteria: (for future iterations)
#name endings (y, ie)
#syllables
#middle names maybe 1,2,3 syllables
#alliteration

###init some variables###
surname = ""
name_idea_list = []
user_has_more_names = true
vowel_pattern = /[aeiouy]/ #sometimes...or...always... y...
consonant_pattern = /[bcdfghjklmnpqrstvwx]/ #...never y...
alphabet_pattern =/[abcdefghijklmnopqrstuvwxyz]/
file = "bad_initials.txt"
@bad_initials = []

###METHOD DEFINITIONS###
def build_subpattern(name, pattern) #doesnt seem to like 1 letter surnames
  subpattern_string = ""
  letters_from_name = name.downcase.scan(pattern).sort
  letters_from_name.each do |letter|
    subpattern_string += letter
  end
  subpattern_string.squeeze!
  /[#{subpattern_string}]/
end

def create_sorted_frequency_hash(list, pattern)
  frequency_hash = Hash.new(0)
  list.each do |name|
    frequency_hash[name] = name.downcase.scan(pattern).count
  end
  frequency_hash = frequency_hash.sort_by {|_key, value| value}.reverse.to_h #sort by the frequency of vowels occuring...
end

def get_name_combinations(frequency_hash)
  combinations = []
  frequency_hash.each { |first, ffreq|
    frequency_hash.each { |middle, mfreq|
      unless first.eql? middle then combinations.push("#{first} #{middle}") end
    }
  }
  combinations
end

def get_initials(full_name)
  full_name.split.map(&:chr).join
end

def initials_are_bad(initials)
  @bad_initials.include? initials
end

###PROGRAM START###
File.readlines(file).each do |line|
  @bad_initials += line.split
end

##processing
print "What will be the baby's last name? "
surname = STDIN.gets.chomp.capitalize
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

#puts name_vowel_frequency = create_sorted_frequency_hash(name_idea_list, surname_vowel_pattern)
#puts name_consonant_frequency = create_sorted_frequency_hash(name_idea_list, surname_consonant_pattern)
puts name_alphabet_frequency = create_sorted_frequency_hash(name_idea_list, surname_alphabet_pattern)

get_name_combinations(name_alphabet_frequency).each { |combo|
  full_name ="#{combo} #{surname}" #todo: full_name.get_initials
  initials = get_initials(full_name) #todo: initials.are_bad
  unless initials_are_bad(initials) then puts full_name else puts "#{initials} is a risky initial combination for the name #{full_name}" end
}