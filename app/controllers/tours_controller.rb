class ToursController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_tour, only: [:show, :edit, :update, :destroy]

  def index
    @tours = ToursService.new.get_tours(filter_params)
    @kind = filter_params[:kind]
  end

  def show
    @oder = Oder.new
  end

  def new
    @tour = Tour.new
  end

  def edit; end

  def create
    @tour = Tour.new(tour_params)
    respond_to do |format|
      if @tour.save
        format.html { redirect_to(@tour, notice: 'Тур успешно добавлен!') }
        format.json { render(:show, status: :created, location: @tour) }
      else
        format.html { render(:new) }
        format.json { render(json: @tour.errors, status: :unprocessable_entity) }
      end
    end
  end

  def update
    respond_to do |format|
      if @tour.update(tour_params)
        format.html { redirect_to(@tour, notice: 'Тур успешно обновлен!') }
        format.json { render(:show, status: :ok, location: @tour) }
      else
        format.html { render(:edit) }
        format.json { render(json: @tour.errors, status: :unprocessable_entity) }
      end
    end
  end

  def destroy
    @tour.destroy
    respond_to do |format|
      format.html { redirect_to(tours_url, notice: 'Tур успешно удален!.') }
      format.json { head(:no_content) }
    end
  end

  private

  def set_tour
    @tour = Tour.find(params[:id])
  end

  def tour_params
    params.fetch(:tour).permit(
  :name,
  :country,
  :city,
  :kind,
  :food,
  :transport,
  :description,
  :hotel,
  :stars,
  :nights,
  :price,
  :image
  )
  end

  def filter_params
    properties = params.permit(
  :kind,
  :sort,
  :country,
  :city,
  :food,
  :transport,
  :stars_arr,
  :min_nights,
  :max_nights,
  :min_price,
  :max_price,
  :commit
  )
    properties[:stars_arr] = params.require(:stars_arr).permit(%w[1 2 3 4 5]) if params[:stars_arr]
    properties
  end
end
