class Api::V1::UsersController < ApplicationController
  skip_before_action :authenticate_user!, only: [:create], raise: false
  def create
    user = User.create(params)
    if user.errors.any?
      puts "ERROR>> while ctreating user: #{user.inspect}"
      render_error(user, :unprocessable_entity)
    else
      render json: user, status: :created
    end
    respond_to do |f|
      f.json {render json: {}, status: status}
    end
  end
end
