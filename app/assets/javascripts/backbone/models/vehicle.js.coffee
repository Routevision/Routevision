class Routevision.Models.Vehicle extends Backbone.Model
  paramRoot: 'vehicle'
  urlRoot: '/api/vehicles'

  # defaults:

class Routevision.Collections.VehiclesCollection extends Backbone.Collection
  model: Routevision.Models.Vehicle
  url: '/api/vehicles'
  leg: (leg_id) -> @url = '/api/legs/'+leg_id+'/vehicles'
  route: (route_id) -> @url = '/api/routes/'+route_id+'/vehicles'
