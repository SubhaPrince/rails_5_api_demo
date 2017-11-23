class Api::V1::TopicsController < ApplicationController
  before_action :authenticate_user!

  def index
    puts current_user.inspect
    topics = current_user.topics
    render json: topics
  end
  def create
    topic = current_user.topics.create(topic_params)
    if topic.errors.any?
      puts "ERROR>> while ctreating user: #{topic.inspect}"
      render_error(topic, :unprocessable_entity)
    else
      render json: topic, status: :created
    end
  end

  def users
    topic = Topic.find_by_name(params[:id])
    users = topic.users
    render json: users
  end

  private
  def topic_params
    params.permit(:name, :description)
  end
end
