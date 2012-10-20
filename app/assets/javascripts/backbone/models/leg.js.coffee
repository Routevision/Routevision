class Routevision.Models.Leg extends Backbone.Model
  paramRoot: 'leg'
  urlRoot: '/api/legs'
  stops: (cb) ->
    stops = new Routevision.Collections.StopsCollection
    stops.leg(@id)
    stops.fetch
      complete: => cb.apply(@, [stops]) if typeof cb is 'function'

  # defaults:

class Routevision.Collections.LegsCollection extends Backbone.Collection
  model: Routevision.Models.Leg
  url: '/legs'
  route: (route_id) -> @url = '/api/routes/'+route_id+'/legs'
