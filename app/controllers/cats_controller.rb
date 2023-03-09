class CatsController < ApplicationController

  # GET: /cats ok
  get "/cats" do
    if logged_in?
      @cats = current_user.cats
      # binding.pry
      erb :"/cats/index.html"
    else 
      flash[:error] = "Please log in."
      redirect '/login'
    end
  end

  # GET: /cats/new ok
  get "/cats/new" do
    if logged_in? && current_user
      @cat = Cat.new
      # binding.pry
      erb :"/cats/new.html"
    else 
      redirect '/login' 
    end
  end

  # POST: /cats ok
  post "/cats" do
    if logged_in?
      # @diary = Diary.all
      @cat = current_user.cats.build(name: params[:cat][:name])
      found_cat = current_user.cats.find_by(name: @cat.name)
        if found_cat
          flash[:error] = "You've already saved this cat."
          redirect '/cats/new'
        else
          @cat.save
          redirect '/cats'
        end
    else 
      redirect '/login'
    end
  end

  # GET: /cats/5 ok
  get "/cats/:id" do
    if logged_in? && current_user
      @cat = Cat.find_by_id(params[:id])
      erb :"/cats/show.html"
    else
      redirect '/cats'
    end
  end

  # GET: /cats/5/edit ok
  get "/cats/:id/edit" do
    if logged_in? && current_user
      @cat = Cat.find_by_id(params[:id])
      erb :"/cats/edit.html"
    else
      redirect '/cats'
    end  
  end

  # PATCH: /cats/5 ok
  patch "/cats/:id" do
    if logged_in? && current_user
      @cat = Cat.find_by_id(params[:id])
      @cat.update(name: params[:cat][:name])
      @cat.save
      redirect "/cats/#{@cat.id}"
    else 
      redirect "/cats/#{@cat.id}/edit"
    end
  end

  # DELETE: /cats/5/delete ok - gives sinatra error when going to route and not logged in????
  delete "/cats/:id/delete" do
    if logged_in? && current_user
      @cat = Cat.find_by_id(params[:id])
      @diaries = Diary.find_by(params[:cat_id]) 
        @cat.destroy && @diaries.destroy
        redirect '/'
    else
      flash[:error] = "Please log in."
      redirect '/login'
    end
  end


end
