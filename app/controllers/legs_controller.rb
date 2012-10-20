class LegsController < ApplicationController
  def index
    route = find_route params[:route_id]
    render_json case route
    when nil
      SfTransit::Leg.all
    when false
      nil
    else
      route.legs
    end
  end

  def show
    render_json SfTransit::Leg.find params[:id]
  end
end
