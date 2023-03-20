class CatsController < ApplicationController

  # GET: /cats
  get "/cats" do
    if logged_in?
      @cats = current_user.cats
      erb :"/cats/index.html"
    else 
      flash[:error] = "Please log in."
      redirect '/login'
    end
  end

  # GET: /cats/new
  get "/cats/new" do
    if logged_in? && current_user
      @cat = Cat.new
      erb :"/cats/new.html"
    else 
      redirect '/login' 
    end
  end

  # POST: /cats
  post "/cats" do
    if logged_in?
      @cat = current_user.cats.build(name: params[:cat][:name])
      found_cat = current_user.cats.find_by(name: @cat.name)
        if found_cat
          flash[:error] = "You've already saved this cat!"
          redirect '/cats/new'
        else
          @cat.save
          redirect '/cats'
        end
    else 
      redirect '/login'
    end
  end

  # GET: /cats/5
  get "/cats/:id" do
    if logged_in? && current_user
      @diary = Diary.find_by_id(params[:id])
      @cat = Cat.find_by_id(params[:id])
        if @cat.id && @diary.cat_id
          erb :"/cats/show.html"
        else
          redirect '/cats'
        end
    end
  end

  # GET: /cats/5/edit
  get "/cats/:id/edit" do
    if logged_in? && current_user
      @cat = Cat.find_by_id(params[:id])
      if @cat.user_id == current_user.id
        erb :"/cats/edit.html"
      else
        redirect '/cats'
      end
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
      @cat = current_user.cats.find_by_id(params[:id])
      # @diaries = Diary.find_by_id(cat_id: @cat.id)
        @cat.destroy 
        redirect '/cats'
    else
      redirect '/login'
    end
  end


end
