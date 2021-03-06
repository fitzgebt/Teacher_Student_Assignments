require './config/environment'

class ApplicationController < Sinatra::Base
  

  configure do
    enable :sessions
    set :session_secret, "my_app_secret"
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    erb :home
  end

  def current_user
    Teacher.find_by_id(session[:teacher_id])
  end

  def logged_in?
    !!current_user
  end

  def current_slug
    current_user.slug
  end
end
