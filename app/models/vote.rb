class Vote < ActiveRecord::Base
  belongs_to :voteable, polymorphic: true
  belongs_to :user

  def upvote
  	if self.status && self.status < 1
  		self.status+= 1
  	else
  		self.status = 1
  	end
  end

  def downvote
  	if self.status && self.status > -1
  		self.status -= 1
  	else
  		self.status = -1
  	end
  end

end
