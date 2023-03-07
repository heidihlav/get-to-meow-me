class CatsController < ApplicationController

  # GET: /cats
  get "/cats" do
    if logged_in?
      @cats = Cat.all
      erb :"/cats/index.html"
    else 
      redirect '/login'
    end
  end

  # GET: /cats/new
  get "/cats/new" do
    if logged_in?
      @cat = Cat.new
      erb :"/cats/new.html"
    else 
      redirect '/login' 
    end
  end

  # POST: /cats
  post "/cats" do
    if logged_in?
      # @diary = Diary.all
      @cat = current_user.cats.build(name: params[:cat][:name])
      binding.pry
      if current_user.cats = "" && @cat.name = ""
        @cat.save
        redirect '/cats'
      else 
        flash[:error] = "You've already saved this cat."
        redirect '/login'
      end
    end
  end

  # GET: /cats/5
  get "/cats/:id" do
    if logged_in?
      @cat = Cat.find_by_id(params[:id])
      erb :"/cats/show.html"
    else 
      redirect '/login'
    end
  end

  # GET: /cats/5/edit
  get "/cats/:id/edit" do
    if logged_in? && current_user
      @cat = Cat.find_by_id(params[:id])
      erb :"/cats/edit.html"
    else
      redirect '/cats'
    end  
  end

  # PATCH: /cats/5
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

  # DELETE: /cats/5/delete
  delete "/cats/:id/delete" do
    if logged_in? && current_user
      @cat = Cat.find_by_id(params[:id])
        @cat.delete
        redirect '/cats'
    else       
      redirect "/cats/#{@cat.id}/edit"
    end
  end


end
