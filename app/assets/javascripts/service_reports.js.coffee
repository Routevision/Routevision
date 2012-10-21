# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$service_report_form = $ '#new_service_report, .edit_service_report'
return unless $service_report_form.length

#########
# Setup #
#########

service_report = new Routevision.Models.ServiceReport
service_report.id = $('#service_report_id').val()
console.log service_report.id

#########################################
# Show only legs for the selected route #
#########################################

select_axis = $service_report_form.find '#service_report_axis_id'

# @TODO: Fix this hack
select_axis.find('option').each ->
  value = this.getAttribute('data-value')
  this.value = value if value

original_axes = select_axis.clone()
$service_report_form.find('#service_report_route').change ->
  select_axis.find('option').not((i, e) -> not e.value).remove()
  route = $(this).find('option:selected')
  original_axes.find('option.route-'+route.val()).clone().appendTo(select_axis)


##################################
# Update with LatLng Coordinates #
##################################



###################
# Save the report #
###################

saveServiceReport = ->
  saveRequest = 
    type: if service_report.id then 'PUT' else 'POST'
    url: '/api/service_reports'+(if service_report.id then '/'+service_report.id else '')
    data: $service_report_form.serialize()
    success: (rsp) ->
      service_report.set rsp
      successfullyGotLatLng = (position) ->
        service_report.set
          lat: position.coords.latitude
          lng: position.coords.longitude
        service_report.save
          success: ->
            console.log arguments
      didntGetLatLng = ->
      navigator.geolocation.getCurrentPosition successfullyGotLatLng, didntGetLatLng
  $.ajax saveRequest

$service_report_form.bind 'submit', ->
  saveServiceReport()
  false
