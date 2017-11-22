class User < ApplicationRecord
  has_secure_token
  has_secure_password # it tell to load bcrypt-ruby
  has_and_belongs_to_many :topics
  def self.create(params)
    retry_count = 2
    begin
      if params[:email].blank?
        raise ArgumentError.new("email is a required field")
      end
      if params[:password].blank?
        raise ArgumentError.new("password is a required field")
      end

      user       = User.new
      user.email   = params[:email]
      user.age     = params[:age]
      user.full_name = params[:full_name]
      user.password  = params[:password]
      dup = user.duplicate
      if dup.present?
        return dup
      end
      if user.save
        return user
      else
        puts "DEBUG>> error while saving User: #{user.errors.inspect}"
        return nil
      end
    rescue ActiveRecord::RecordNotUnique => e
      puts "DEBUG>> caught record not unique exception while making User: #{e.message}"
      retry_count -= 1
      retry if retry_count > 0
      puts e.backtrace.join("\n\t")
      return nil
    end
  end

  # check the duplicate user with a valid email
  def duplicate
    return User.where("email = ?", self.email).take
  end

  # updating token for logout operation
  def invalidate_token
    self.update_columns(token: nil)
  end

  # first checks the email is exist in the data base or not
  # if the email is valid then check for password 
  # if both matches the return the user
  def self.valid_login?(email, password)
    user = find_by(email: email)
    if user && user.authenticate(password)
      user
    end
  end
end
