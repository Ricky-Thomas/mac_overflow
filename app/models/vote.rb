class Vote < ActiveRecord::Base
  belongs_to :voteable, polymorphic: true
  belongs_to :user

  def upvote
  	self.status = 1
  end

  def downvote
  	self.status = -1
  end

end
