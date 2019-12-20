class SightingsController < ApplicationController

  get '/sightings' do
    @sightings = Sighting.all
    erb :'/sightings/sighting_index'
  end

  get '/sightings/new' do
    erb :'/sightings/new_sighting'
  end

  post '/new' do
    @sighting = Sighting.new(:time => params[:time], :place => params[:location])
    redirect to "/sightings"
  end

end
