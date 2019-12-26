class SightingsController < ApplicationController

  get '/sightings' do
    @sightings = Sighting.all
    erb :'/sightings/sighting_index'
  end

  get '/sightings/new' do
    erb :'/sightings/new_sighting'
  end

  get "/sightings/:id" do
    @sighting = Sighting.find_by_id(params[:id])
    erb "/sightings/show_sighting"
  end

  post '/new' do
    @sighting = current_user.sightings.create(:time => params[:time], :place => params[:location])
    @bird = Bird.create(:species => params[:species])
    #Bird.all.each method here?
    @sighting.bird = @bird
    @sighting.save
    redirect to "/sightings"
  end

end
