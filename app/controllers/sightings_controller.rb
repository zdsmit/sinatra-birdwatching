class SightingsController < ApplicationController

  get '/sightings' do
    @sightings = Sighting.all
    erb :'/sightings/sighting_index'
  end

  get '/sightings/new' do
    erb :'/sightings/new_sighting'
  end

  post '/new' do
    @sighting = Sighting.create(:time => params[:time], :place => params[:location])
    @sighting.user = current_user
    @bird = Bird.create(:species => params[:species])
    #Bird.all.each method here?
    @sighting.bird = @bird
    @sighting.save
    redirect to "/sightings"
  end

end
