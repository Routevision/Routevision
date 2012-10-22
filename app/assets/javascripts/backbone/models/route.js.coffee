class Routevision.Models.Route extends Backbone.Model
  paramRoot: 'route'
  urlRoot: '/api/routes'
  legs: (cb) ->
    legs = new Routevision.Collections.LegsCollection
    legs.route(@id)
    legs.fetch
      complete: => cb.apply(@, [legs]) if typeof cb is 'function'
  vehicles: (cb) ->
    vehicles = new Routevision.Collections.VehiclesCollection
    vehicles.route @id
    vehicles.fetch
      success: -> cb.apply(@, [vehicles]) if typeof cb is 'function'

  # defaults:

class Routevision.Collections.RoutesCollection extends Backbone.Collection
  model: Routevision.Models.Route
  url: '/api/routes'



