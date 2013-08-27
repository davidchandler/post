class Category < ActiveRecord::Base
 has_many :categorizations
 has_many :posts, through: :categorizations

 after_validation :generate_slug

  
 def generate_slug
   self.slug = self.name.gsub(" ", "-").downcase
 end

 def to_param
   self.slug
 end

end