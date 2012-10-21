[SfTransit::Stop].each do |model|
  model.class_eval do
    def as_json options = {}
      super(options.merge(:except => [:created_at, :updated_at, :transfer_id]))
    end
  end
end

SfTransit::Route.class_eval do
  def as_json options = {}
    super(options.merge(:except => [:created_at, :updated_at, :transfer_id]))
  end

  def vehicles
    if @vehicles.nil? or Time.now.to_i - @last_vehicle_request > 1.minute
      require 'net/http'
      require 'nokogiri'
      path = "/service/publicXMLFeed?command=vehicleLocations&a=sf-muni&r=#{self.abbr}"
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
    @vehicles
  end
end

SfTransit::Leg.class_eval do
  def as_json options = {}
    super(options.merge(:except => [:created_at, :updated_at, :transfer_id]))
  end
    
  def vehicles
    self.route.vehicles.select {|v| v[:dirTag] === self.abbr}
  end
end