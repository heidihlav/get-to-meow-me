class DiariesController < ApplicationController

  # GET: /diaries
  get "/cats/:id/diaries" do
    if logged_in? && current_user 
      @cat = Cat.find_by(params[:id])
      @diaries = current_user.diaries.find_by(cat_id: params )
      binding.pry
      # @diary = Diary.find_by_id(params[:id]) cat_id: params[:diary][:cat_id] 
      # @diaries = @cat.diaries   @cat.id
      erb :"/diaries/index.html"
    else
      flash[:error] = "You don't have any entries for this cat."
      redirect '/cats'
    end
  end

  # GET: /diaries/new
  get "/cats/:id/diaries/new" do
    if logged_in? && current_user.cats != []
      @cat = current_user.cats.find_by_id(params[:id])
      @diary = Diary.new
      @diary.cat_id
      erb :"/diaries/new.html"
    else 
      redirect '/cats' 
    end
  end

  # POST: /diaries
  post "/cats/:id/diaries" do
    if logged_in?
      @diary = current_user.diaries.build(id: params[:diary][:id], cat_id: params[:diary][:cat_id], mood: params[:diary][:mood], behavior: params[:diary][:behavior], date: params[:diary][:date])
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
      @cat = Cat.find_by(params[:id])
      @diary = current_user.diaries.find_by(cat_id: @cat.id)
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
      redirect '/cats'
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
        redirect '/cats'
    else       
      redirect "/diaries/#{@diary.id}/edit"
    end
  end
  
end