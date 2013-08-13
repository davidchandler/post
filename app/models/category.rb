class Category < ActiveRecord::Base
 has_many :Categorizations
 has_many :posts, through: :Categorizations
end