class User < ActiveRecord::Base
   has_many :posts
   has_many :comments
   has_many :votes

   has_secure_password validations: false

   validates :username,
     presence: true,
     uniqueness: true
   validates :password,
     presence: true,
     on: :create,
     length: { minimum: 3 }


   

   def already_voted_on?(obj)
     self.votes.where(voteable: obj).size > 0
   end 


  def to_param
    self.slug
  end

end