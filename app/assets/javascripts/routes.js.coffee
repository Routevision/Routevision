# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

map = $('#map')

if map.length
  loadScript = (cb, context, args) ->
      window.mapViewCallback = -> cb.apply context, args
      s = document.createElement 'script'
      s.src = 'http://maps.googleapis.com/maps/api/js?key=AIzaSyDeXDNgLH-pHARmPdY9vP_NWrCtH4X5xu4&sensor=true&callback=mapViewCallback'
      s.type = 'text/javascript'
      document.body.appendChild s

  loadScript (-> 
    el = document.getElementById('map')
    navigator.geolocation.getCurrentPosition (position) ->
      center = new google.maps.LatLng position.coords.latitude, position.coords.longitude 
      map = @map = new google.maps.Map el,
        mapTypeId: google.maps.MapTypeId.ROADMAP
        center: center
        zoom: 13
      vehicles = new Routevision.Collections.VehiclesCollection
      vehicles.fetch
        success: ->
          _.each vehicles.models, (v) ->
            new google.maps.Marker
              position: new google.maps.LatLng v.get('lat'), v.get('lon')
              map: map
    ), @
