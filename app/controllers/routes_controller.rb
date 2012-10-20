class RoutesController < ApplicationController
  def index
    render :json => SfTransit::Route.all
  end

  def show
    route = SfTransit::Route.find params[:id] rescue nil
    if route.nil?
      render :json => '', :status => 404
    else
      render :json => route
    end
  end
end
