class IslandsController < ApplicationController
  def index
    @islands = Island.all
    if params[:query].present?
      sql_query = <<~SQL
      islands.name ILIKE :query
      OR islands.location ILIKE :query
      OR islands.description ILIKE :query
      SQL
      @islands = Island.where(sql_query, query: "%#{params[:query]}%")
    else
      @islands = Island.all
    end
    @markers = @islands.geocoded.map do |island|
      {
        lat: island.latitude,
        lng: island.longitude
      }
    end
  end

  def show
    @island = Island.find(params[:id])
    @booking = Booking.new
  end

  def new
    @island = Island.new
  end

  def create
    @island = Island.new(island_params)
    @island.user = current_user
    if @island.save
      redirect_to island_path(@island), notice: 'Your island was successfully created.'
    else
      render :new, status: :unprocessable_entity, notice: 'The island was not created.'
    end
  end

  def edit
    @island = Island.find(params[:id])
  end

  def update
    @island = Island.find(params[:id])
    @island.update(island_params)
    redirect_to island_path(@island)
  end

  def destroy
    @island = Island.find(params[:id])
    @island.destroy
    redirect_to islands_path, status: :see_other
  end

  private

  def island_params
    params.require(:island).permit(:name, :price, :location, :description, photos: [])
  end
end
