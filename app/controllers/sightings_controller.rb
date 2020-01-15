class SightingsController < ApplicationController

  get '/sightings' do
    if logged_in?
      @sightings = Sighting.all
      erb :'/sightings/sighting_index'
    else
      redirect to "/login"
    end
  end

  get '/sightings/new' do
    if logged_in?
      erb :'/sightings/new_sighting'
    else
      redirect to "/login"
    end
  end

  get "/sightings/:id" do
    if logged_in?
      @sighting = Sighting.find_by_id(params[:id])
      erb :'/sightings/show_sighting'
    else
      redirect to "/login"
    end
  end

  get "/sightings/:id/edit" do
    if logged_in?
      @sighting = Sighting.find_by_id(params[:id])
      erb :'/sightings/update_sighting'
    else
      redirect to "/login"
    end
  end

  post '/new' do
    @sighting = Sighting.create(:time => params[:time], :place => params[:place])
    @sighting.user = current_user
    @bird = Bird.create(:species => params[:species])
    #Bird.all.each method here?
    @sighting.bird = @bird
    @sighting.save
    redirect to "/sightings"
  end

  patch "/sightings/:id" do
    if params[:bird] == "" || params[:place] == "" || params[:time] == ""
        redirect to "/sightings/#{params[:id]}/edit"
    else
      @sighting = Sighting.find_by_id(params[:id])
      @bird = params[:bird]
      if @sighting and @sighting.user == current_user
        if @sighting.update(place: params[:place], time: params[:time])
          Bird.all.detect do |bird|
            if bird.species == @bird
              @sighting.bird = bird
            else
              @newbird = Bird.create(species: @bird)
              @sighting.bird = @newbird
              @sighting.update(bird: @newbird)
            end
          end
          redirect to "/sightings/#{@sighting.id}"
        else
          redirect to "/sightings/#{params[:id]}/edit"
        end
      else
        redirect to "/sightings/#{@sighting.id}"
      end
    end
  end

  delete "/sightings/:id" do
    @sighting = Sighting.find(params[:id])
    if @sighting and @sighting.user == current_user
      @sighting.destroy
    end
    redirect to '/sightings'
  end

end
