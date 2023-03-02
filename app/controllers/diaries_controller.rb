class DiariesController < ApplicationController

  # GET: /diaries
  get "/diaries" do
    if logged_in?
      @diaries = Diary.all
      erb :"/diaries/index.html"
    else
      redirect '/login'
    end
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
      @diary = current_user.diaries.build(title: params[:diary][:title], date: params[:diary][:date])
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
    if logged_in? && current_user
      @diary = Diary.find_by_id(params[:id])
      # binding.pry
      erb :"/diaries/edit.html"
    else
      redirect '/diaries'
    end
  end

  # PATCH: /diaries/5
  patch "/diaries/:id" do
    if logged_in? && current_user
      @diary = Diary.find_by_id(params[:id])
      @diary.update(title: params[:diary][:title], date: params[:diary][:date])
      @diary.save
      redirect "/diaries/#{@diary.id}"
    else 
      redirect "/diaries/#{@diary.id}/edit"
    end
  end

  # DELETE: /diaries/5/delete
  delete "/diaries/:id/delete" do
    if logged_in? && current_user
      @diary = Diary.find_by_id(params[:id])
        @diary.delete
        redirect '/diaries'
    else       
      redirect "/diaries/#{@diary.id}/edit"
    end
  end
  
end

# , mood: params[:cat][:mood], behavior: params[:cat][:behavior]