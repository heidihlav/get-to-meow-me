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
    @cat = Cat.new
    erb :"/cats/new.html"
  end

  # POST: /cats
  post "/cats" do
    if logged_in?
      @cat = current_user.cats.build(name: params[:cat][:name], mood: params[:cat][:mood], behavior: params[:cat][:behavior])
    if @cat.save
      redirect '/cats'
    else
      flash[:error] = "You've already saved this cat."
      erb :'cats/new.html'
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
    @cat = Cat.find_by_id(params[:id])
    erb :"/cats/edit.html"
  end

  # PATCH: /cats/5
  patch "/cats/:id" do
    redirect "/cats/:id"
  end

  # DELETE: /cats/5/delete
  delete "/cats/:id/delete" do
    redirect "/cats"
  end
end
