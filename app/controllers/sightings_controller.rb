class SightingsController < ApplicationController

  get '/sightings' do
    if !logged_in?
      erb :'/users/signup'
    else
      @sightings = Sighting.all
      erb :'/sightings/sighting_index'
    end
  end

  get '/sightings/new' do
    if !logged_in?
      erb :'/users/signup'
    else
      erb :'/sightings/new_sighting'
    end
  end

  post '/new' do
    @sighting = Sighting.new(:time => params[:time], :place => params[:location])
  end

end
