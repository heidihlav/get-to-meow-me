class UsersController < ApplicationController 

get '/users/new' do 
  erb :'/users/new'
end 
  
post '/users' do
  @user = User.new(email: params[:email], password: params[:password])
    if @user.save
      session[:id] = @user.id
      redirect '/'
    else
      flash[:error] = "Incorrect username or password."
      erb :'users/new'
    end
end






end
