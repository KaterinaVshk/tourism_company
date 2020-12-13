class StaticPagesController < ApplicationController
    def index
        @tours = ToursService.new.get_tours(filter_params)
        @kind = filter_params[:kind]
    end

    private
    # Use callbacks to share common setup or constraints between actions.

    # Only allow a list of trusted parameters through.

    def filter_params
      properties = params.permit(:kind, :sort,:country, :city, :food, :transport,
                  :min_nights, :max_nights, :min_price, :max_price,
                  :commit)
      properties[:stars_arr] = params.require(:stars_arr).permit(%w(1 2 3 4 5)) if params[:stars_arr]
      properties
    end

end