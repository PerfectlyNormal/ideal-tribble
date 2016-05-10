class VenuesController < ApplicationController
  def index
    if params[:q].present?
      @query  = params[:q].to_s
      @venues = Venue.search_by_city(@query)
      render :search
    else
      # render default
    end
  end
end
