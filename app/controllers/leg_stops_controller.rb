class LegStopsController < ApplicationController
  def index
    leg = find_leg params[:leg_id]
    stop = find_stop params[:stop_id]
    render_json case leg
    when nil
      case stop
      when nil
        nil
      else
        stop.leg_stops.collect { |ls| ls.leg }
      end
    when false
      nil
    else
      leg.leg_stops.collect {|ls| ls.stop }
    end
  end

  def show
    render_json params
  end
end
