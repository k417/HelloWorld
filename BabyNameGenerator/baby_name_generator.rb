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
