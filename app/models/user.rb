class User < ActiveRecord::Base
	validates :email, :name
end
