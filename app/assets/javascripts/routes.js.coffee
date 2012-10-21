# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

leg = new Routevision.Models.Leg
leg.id = 1
leg.stops (stops) ->
  window.stops = stops
  console.log stops.toJSON()
