class SessionsController < ApplicationController

  get '/login' do

  end



  post '/login' do

  end



  get '/logout' do
    session.clear
    redirect '/'
  end





end