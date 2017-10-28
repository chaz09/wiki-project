class User < ActiveRecord::Base

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         has_many :collaborators

         enum role: [:standard, :premium, :admin]
         def set_default_role
           self.role ||= 'standard'
         end

         def upgrade_to_premium
           self.update_attribute(:role, "premium")
         end

         def admin?
           role == 'admin'
         end

         def standard?
           role == 'standard'
         end

         def premium?
           role == 'premium'
         end

      
def wikis_collaborated_on
   collaborators.map(&:wiki)
  end
end
