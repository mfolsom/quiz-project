class Question < ActiveRecord::Base
  belongs_to :user

  def self.random
    self.order("RANDOM()").first
  end

  def author
    self.user.username
  end
end
