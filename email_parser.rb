#This is file will parse the random_text.txt for emails address domains and output them
#The email address domains will be stored in a Hash to keep track of the frequency of each domain match

domain_name_pattern = /\w\@(\w*.\w*)/
domain_name_matches = File.read("random_text.txt").scan(domain_name_pattern)

frequency_hash = Hash.new(0)

domain_name_matches.each do |domain|
  frequency_hash[domain] += 1
end

frequency_hash.sort
frequency_hash.each { |domain, freq| puts "#{domain[0].rjust(13)}: #{freq} time(s)"}
