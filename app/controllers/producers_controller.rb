class ProducersController < ApplicationController

  def index
  end

  def new
    @producer = Producer.new
  end

  def create
    @producer = Producer.create(message_params)
    if @producer.valid?
      redirect_to  root_path
    else
      render "new"
    end
  end

  private
  def message_params
    params.require(:producer).permit(:name, :bio , :image)
  end

end
