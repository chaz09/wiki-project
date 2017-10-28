class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
has_many :collaborators

         enum role: [:standard, :premium, :admin]

def wikis_collaborated_on
   collaborators.map(&:wiki)
  end
end 
