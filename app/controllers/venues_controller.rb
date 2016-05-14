class VenuesController < ApplicationController
  def index
    if params[:q].present?
      @query  = params[:q].to_s
      @venues = Venue.in_city(@query)
      render :search
    else
      # render default
    end
  end

  def show
    @venue = Venue.find(params[:id])
  end
end
