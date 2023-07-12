class MovieActorsController < ApplicationController

  def new
    @movie = Movie.find(params[:movie_id])
    @actors = Actor.excluding(@movie.actors)

  end

  def add
    @movie_id = params[:movie_id]
    @actor_id = params[:actor_id]

    @movie = Movie.find(@movie_id)
    if @movie.actors.where(id: @actor_id).count == 0
        @movie_actor = MovieActor.new
        @movie_actor.movie_id = @movie.id.to_i
        @movie_actor.actor_id = @actor_id.to_i
        @movie_actor.save
    end
    redirect_to new_movie_movie_actor_path(@movie)
  end

  def show
  end

  def create
  end

  def destroy

  end

end
