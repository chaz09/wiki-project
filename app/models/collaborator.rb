class Collaborator < ActiveRecord::Base
belongs_to :wiki
attr_accessor :email, :password, :role

end
