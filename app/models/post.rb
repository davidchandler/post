class Post < ActiveRecord::Base
  belongs_to :creator, class_name: 'User', foreign_key: :user_id
#  belongs_to :user
  has_many :comments
  has_many :categorizations
  has_many :categories, through: :categorizations
  has_many :votes, as: :voteable


  validates :title, presence: true, length: {minimum: 5}
  validates :url,   presence: true

  def total_votes
    self.votes.where(vote: true).size  - self.votes.where(vote: false).size 
  end

end