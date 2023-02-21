class DiariesController < ApplicationController

  # GET: /diaries
  get "/diaries" do
    erb :"/diaries/index.html"
  end

  # GET: /diaries/new
  get "/diaries/new" do
    erb :"/diaries/new.html"
  end

  # POST: /diaries
  post "/diaries" do
    redirect "/diaries"
  end

  # GET: /diaries/5
  get "/diaries/:id" do
    erb :"/diaries/show.html"
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
