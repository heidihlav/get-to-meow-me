class SessionsController < ApplicationController

  get '/login' do
    erb :'/sessions/login'
  end

  post '/login' do
    @user = User.find_by(:username => params[:username])
    if @user != nil && @user.password == params[:password]
      session[:id] = @user.id
      redirect to '/'
    else
      flash[:error] = "Incorrect email or password."
      redirect '/sessions/login'
    end
  end


  get '/logout' do
    session.clear
    redirect '/'
  end


end