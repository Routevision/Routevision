class VehiclesController < ApplicationController
  def index
    leg = find_leg params[:leg_id]
    route = find_route params[:route_id]

    render_json case leg
    when false
      nil
    when nil
      case route
      when false
        nil
      when nil
        vehicles
      else
        route.vehicles
      end
    else
      leg.vehicles
    end
  end

  private

  def vehicles
    if @vehicles.nil? or Time.now.to_i - @last_vehicle_request > 1.minute
      require 'net/http'
      require 'nokogiri'
      path = "/service/publicXMLFeed?command=vehicleLocations&a=sf-muni"
      req = Net::HTTP::Get.new path
      res = Net::HTTP.start('webservices.nextbus.com', 80) do |http|
        http.request(req)
      end
      data = Nokogiri::XML.parse(res.body)
      vehicles = data.css('vehicle').collect do |v|
        vehicle = {}
        v.each { |k, v| vehicle[k.to_sym] = v}
        vehicle
      end
      @last_vehicle_request = Time.now.to_i
      @vehicles = vehicles
    end
  end
end
