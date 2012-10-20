class Routevision.Models.LegStop extends Backbone.Model
  paramRoot: 'leg_stop'
  urlRoot: '/api/leg_stops'

  # defaults:

class Routevision.Collections.LegStopsCollection extends Backbone.Collection
  model: Routevision.Models.LegStop
  url: '/api/leg_stops'
