#This is file will parse the random_text.txt for emails address domains and output them
#The email address domains will be stored in a Hash to keep track of the frequency of each domain match

email_pattern = /\w\@(\w*.\w*)/
email_matches = File.read("random_text.txt").scan(email_pattern)

#puts email_matches

word_frequency = Hash.new(0)

email_matches.each do |email|
  word_frequency[email] += 1
end

word_frequency.sort
word_frequency.each { |domain, freq| puts "#{domain[0]} occurs #{freq} times"}
