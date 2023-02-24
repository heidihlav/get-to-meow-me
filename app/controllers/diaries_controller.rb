class DiariesController < ApplicationController

  # GET: /diaries
  get "/diaries" do
    if logged_in?
      @diaries = Diary.all
      erb :"/diaries/index.html"
    else
      redirect '/login'
  end

  # GET: /diaries/new
  get "/diaries/new" do
    if logged_in?
      @diary = Diary.new
      erb :"/diaries/new.html"
    else 
      redirect '/login' 
    end
  end

  # POST: /diaries
  post "/diaries" do
    if logged_in?
      @diary = current_user.diaries.build(title: params[:diary][:title], day: params[:diary][:day], user_id: params[:diary][:user_id])
      @diary.save
      redirect '/diaries'
    else
      flash[:error] = "You've already saved this diary."
      erb :'diaries/new.html'
    end
  end

  # GET: /diaries/5
  get "/diaries/:id" do
    if logged_in?
      @diary = Diary.find_by_id(params[:id])
      erb :"/diaries/show.html"
    else 
      redirect '/login'
    end
  end

  # GET: /diaries/5/edit
  get "/diaries/:id/edit" do

    erb :"/diaries/edit.html"
  end

  # PATCH: /diaries/5
  patch "/diaries/:id" do
    redirect "/diaries/:id"
  end

  # DELETE: /diaries/5/delete
  delete "/diaries/:id/delete" do
    redirect "/diaries"
  end
end
