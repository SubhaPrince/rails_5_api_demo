class User < ApplicationRecord
	has_secure_token
	has_secure_password # it tell to load bcrypt-ruby
end
