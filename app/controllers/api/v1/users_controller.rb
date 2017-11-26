class Api::V1::UsersController < ApplicationController
  before_action :authenticate_user!, only: [:topics], raise: false

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

  def topics
    if params[:id].to_i == 0
      redirect_to :api_login_path if current_user.blank?
      topics = current_user.topics
    else
      user = User.find_by_id(params[:id])
      topics = user.topics if user.present?
    end
    # render json: topics, root: false
    respond_to do |f|
      f.json {render json: topics, status: :ok}
    end
  end
end
