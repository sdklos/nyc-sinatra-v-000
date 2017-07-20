require 'pry'
class FiguresController < ApplicationController

  get '/figures' do

    erb :'/figures/index'
  end

  get '/figures/new' do

    erb :'/figures/new'
  end

  post '/figures' do
    @figure = Figure.create(name: params["figure"]["name"])

    if params["landmark"]["name"]
      @figure.landmarks <<  Landmark.create(name: params["landmark"]["name"], year_completed: params["landmark"]["year_completed"])
    end
    if params["figure"]["landmark_ids"]
      params["figure"]["landmark_ids"].each do |id|
        @figure.landmarks << Landmark.find(id)
      end
    end

    if params["title"]["name"]
      @figure.titles << Title.create(name: params["title"]["name"])
    end
    if params["figure"]["title_ids"]
      params["figure"]["title_ids"].each do |id|
        @figure.titles << Title.find(id)
      end
    end

    @figure.save
   redirect("/figures/#{@figure.id}")
  end

  get '/figures/:id' do
    @figure = Figure.find(params[:id])
    @titles = @figure.titles.all
    @landmarks = @figure.landmarks.all
    erb :'/figures/show'
  end

  get '/figures/:id/edit' do
    @figure = Figure.find(params[:id])

    erb :'figures/edit'
  end

  patch '/figures/:id' do

    @figure = Figure.find(params[:id])
    @figure.update(name: params["figure"]["name"])
    @figure.titles.clear
    @figure.landmarks.clear

    if params["landmark"]["name"]
      @figure.landmarks <<  Landmark.create(name: params["landmark"]["name"], year_completed: params["landmark"]["year_completed"])
    end
    if params["figure"]["landmark_ids"]
      params["figure"]["landmark_ids"].each do |id|
        @figure.landmarks << Landmark.find(id)
      end
    end

    if params["title"]["name"]
      @figure.titles << Title.create(name: params["title"]["name"])
    end
    if params["figure"]["title_ids"]
      params["figure"]["title_ids"].each do |id|
        @figure.titles << Title.find(id)
      end
    end

    @figure.save

    redirect("/figures/#{@figure.id}")

  end


end
