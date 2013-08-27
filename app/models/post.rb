class Post < ActiveRecord::Base
  belongs_to :creator, class_name: 'User', foreign_key: :user_id
#  belongs_to :user
  has_many :comments
  has_many :categorizations
  has_many :categories, through: :categorizations
  has_many :votes, as: :voteable


  validates :title, presence: true, length: {minimum: 5}
  validates :url,   presence: true

  after_validation :generate_slug

  def total_votes
    self.votes.where(vote: true).size  - self.votes.where(vote: false).size 
  end

  def generate_slug
    self.slug = self.title.gsub(" ", "-").downcase
  end

  def to_param
    self.slug
  end

end