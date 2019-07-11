
class BabyName
  attr_reader :name, :user_entered

  def initialize (name, user_entered)
    @name = name; @user_entered = user_entered
  end

  def to_s
    "#{@name} #{@user_entered}"
  end

end
