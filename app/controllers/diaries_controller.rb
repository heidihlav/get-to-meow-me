class DiariesController < ApplicationController

  # GET: /diaries
  get "/cats/:id/diaries" do
    if logged_in? && current_user.diaries != []
      @diaries = current_user.diaries.find_by(params[:cat_id])
      @cat = Cat.find_by(id: @diaries.cat_id) 
      # @diary = Diary.find_by_id(params[:id])
      # @diaries = @cat.diaries
      erb :"/diaries/index.html"
    else
      redirect '/cats'
    end
  end

  # GET: /diaries/new
  get "/cats/:id/diaries/new" do
    if logged_in?
      @cat = Cat.find_by_id(params[:id])
      @diary = Diary.new
      @diary.cat_id
      erb :"/diaries/new.html"
    else 
      redirect '/login' 
    end
  end

  # POST: /diaries
  post "/cats/:id/diaries" do
    if logged_in?
      @diary = current_user.diaries.build(cat_id: params[:diary][:cat_id], mood: params[:diary][:mood], behavior: params[:diary][:behavior], date: params[:diary][:date])
      @diary.save 
      redirect '/cats/:id/diaries'
    else
      flash[:error] = "You've already saved this diary."
      erb :'diaries/new.html'
    end
  end

  # GET: /diaries/5
  get "/diaries/:id" do
    if logged_in?
      @diary = Diary.find_by_id(params[:id])
      @cat = Cat.find_by(id: @diary.cat_id) 
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

