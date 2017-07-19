class LandmarksController < ApplicationController

  get '/landmarks' do

    erb :'/landmarks/index'
  end

  get '/landmarks/new' do

    erb :'/landmarks/new'
  end



end
