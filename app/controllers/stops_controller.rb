class StopsController < ApplicationController
  def index
    render_json SfTransit::Stop.all
  end

  def show
    stop = SfTransit::Stop.find(params[:id]) rescue nil
    render_json stop
  end
end
