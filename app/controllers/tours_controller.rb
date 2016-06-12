class ToursController < ApplicationController
  def index
    city = params["city"]
    start_date = Date.parse(params["start_date"])
    end_date = Date.parse(params["end_date"])

    @tours = Tour.includes(:local).where(city: city, date: start_date..end_date)

    render json: {tours: @tours}, status: 200, include: :local
  end

  def new
  end

  def create
  end

  def edit
  end

  def show
    tour_id = params["id"]
    @tour = Tour.includes(:local).find_by(id: tour_id)
    render json: {tour: @tour}, status: 200, include: :local
  end

  def update
  end

  def destroy
  end
end
