class ApplicationController < ActionController::API
  include ActionController::MimeResponds
  #to varify the authenticate user
  def authenticate_user!
    authenticate_token || render_unauthorized("Access denied")
  end

  # Returns a current logged in user
  def current_user
    @current_user ||= authenticate_token
  end

  protected
  # returns a message for unauthorized user
  def render_unauthorized(message)
    errors = { errors: [ { detail: message } ] }
    render json: errors, status: :unauthorized
  end
  private
  # authenticate_with_http_token takes the token provided in the header of the http request
  # makes it available in the token block variable
  def authenticate_token
    authenticate_with_http_token do |token, options|
      User.find_by(token: token)
    end
  end
end
