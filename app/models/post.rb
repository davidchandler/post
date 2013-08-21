class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  has_many :categorizations
  has_many :categories, through: :categorizations

  validates :title, presence: true, length: {minimum: 5}
  validates :url,   presence: true

end