class MoviesController < ApplicationController

  before_action :find_movie, only: [:show, :edit, :update, :destroy]

  def new
    @movie = Movie.new
    authorize @movie
  end

  def create
    @movie = Movie.create(movie_params)
    authorize @movie
    if @movie.valid?
      params[:movie][:actor_id].each do |actor_id|
        if actor_id != ""
          @movie_actor = MovieActor.new
          @movie_actor.movie_id = @movie.id
          @movie_actor.actor_id = actor_id
          @movie_actor.save
        end
      end
      redirect_to root_path
    else
      render "new"
    end
  end

  def show

  end

  def edit
  end

  def update
    @movie = @movie.update(movie_params)
    authorize @movie
    if @movie
      params[:movie][:actor_id].each do |actor_id|
        if actor_id != ""
          @movie_actor = MovieActor.where(movie_id:@movie)

        end
      end
      redirect_to root_path
    else
        render "edit"
    end
  end

  def destroy
    @movie_actors = MovieActor.all.where(movie_id: @movie).delete_all
    @movie.destroy
    redirect_to root_path
  end

  private
  def movie_params
    params.require(:movie).permit(:title, :duration , :image , :producer_id,:category_id ,:status,:price)
  end
  def find_movie # works without
    @movie = Movie.find(params[:id])
  end
end
