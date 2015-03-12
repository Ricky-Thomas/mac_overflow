class Answer < ActiveRecord::Base
  belongs_to :question
  belongs_to :user
  has_many :comments, as: :commentable
  has_many :votes, as: :votable

  validates_presence_of :content, :question_id, :user_id

  def score_tally
  	count = 0
  	self.votes.each do |vote|
  	 count = count + vote.status
  	end
  	self.score = count
    self.save
  end
end
