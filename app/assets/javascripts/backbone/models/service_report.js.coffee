class Routevision.Models.ServiceReport extends Backbone.Model
  paramRoot: 'service_report'
  urlRoot: '/api/service_reports'

  # defaults:

class Routevision.Collections.ServiceReportsCollection extends Backbone.Collection
  model: Routevision.Models.ServiceReport
  url: '/api/service_reports'
