class Routevision.Models.Stop extends Backbone.Model
  paramRoot: 'stop'
  urlRoot: '/api/stops'

  # defaults:

class Routevision.Collections.StopsCollection extends Backbone.Collection
  model: Routevision.Models.Stop
  url: '/api/stops'
  leg: (leg_id) -> @url = '/api/legs/'+leg_id+'/stops'
