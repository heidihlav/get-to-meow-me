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
    @cats = Cat.all
    @diaries = Diary.all
    erb :index
  end

  helpers

  def logged_in?
    !!current_user
  end

  def current_user
    User.find_by_id(session[:id])  
  end

end
