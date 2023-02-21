require './config/environment'
require 'pry'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    set :sessions, true
    set :session_secret, ENV["SESSION_SECRET"]
    set :method_override, true
    register Sinatra::Flash  
  end

  get "/" do
    erb :index
  end

  helpers

  def logged_in?
    !!current_user
  end

  def current_user
    @current_user ||= User.find_by(id: session[:id]) if session[:id]
  end

end
