class SightingsController < ApplicationController

  get '/sightings' do
    if !logged_in?
      erb :'/users/signup'
    else
      @sightings = Sighting.all
      erb :'/sightings/sighting_index'
    end
  end

end
