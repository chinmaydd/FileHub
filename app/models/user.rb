class User < ActiveRecord::Base

	has_many :uploads
	has_secure_password
end
