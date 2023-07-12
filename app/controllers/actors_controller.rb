class ActorsController < ApplicationController

  def index
  end

  def new
    @actor = Actor.new
  end

  def create
    @actor = Actor.create(message_params)
    if @actor.valid?
      redirect_to  root_path
    else
      render "new"
    end
  end

  private
  def message_params
    params.require(:actor).permit(:name, :bio , :image)
  end

end
