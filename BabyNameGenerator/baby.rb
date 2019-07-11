class Baby
  attr_accessor :gender, :middle_names_count, :languages, :country_of_residence

  def initialize
    yield self if block_given?
  end

  def to_s
    "Baby is #{@gender}, will have #{@middle_names_count} middle names, speak #{@languages}, and live in #{@country_of_residence}"
  end    
end
