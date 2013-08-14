class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  has_many :Categorizations
  has_many :categories, through: :Categorizations

  validates :title, presence: true, length: {minimum: 5}
  validates :url,   presence: true

end