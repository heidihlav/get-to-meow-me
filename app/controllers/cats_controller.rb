class CatsController < ApplicationController

  # GET: /cats
  get "/cats" do
    @cats = Cat.all
    erb :"/cats/index.html"
  end

  # GET: /cats/new
  get "/cats/new" do
    erb :"/cats/new.html"
  end

  # POST: /cats
  post "/cats" do
    @cat = Cat.new(name: params[:name], mood: params[:mood], behavior: params[:behavior])
    if @cat.save
      params[:id] = @cat.id
      redirect '/'
    else
      erb :'cats/new'
      flash[:error] = "You've already saved this cat."
    end
  end

  # GET: /cats/5
  get "/cats/:id" do
    erb :"/cats/show.html"
  end

  # GET: /cats/5/edit
  get "/cats/:id/edit" do
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
