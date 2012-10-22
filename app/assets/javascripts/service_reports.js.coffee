# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$service_report_categories = $ '#queue .category'
$service_report_categories.each ->
  category = $ this
  reports = category.find('.report').hide()
  are_showing = false
  category.find('h3').bind 'click', ->
    reports[if are_showing then 'slideUp' else 'slideDown']()
    are_showing = not are_showing


$service_report_form = $ '#new_service_report, .edit_service_report'

if $service_report_form.length

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
          service_report.save {},
            success: ->
              $service_report_form.html('THANKS!! :D :D :D')
        didntGetLatLng = ->
          $service_report_form.html('THANKS!! :D :D :D')
        navigator.geolocation.getCurrentPosition successfullyGotLatLng, didntGetLatLng
    $.ajax saveRequest

  $service_report_form.bind 'submit', ->
    saveServiceReport()
    false

reportTpl = _.template('<div class="report report-id-<%= id %>"><h6 class="route-title"><%= title %></h6><span class="time"><%= created_at %></span><p><%= report_text %></p></div>')

window.appendReport = (report) ->
  console.log report
  $report = $('.report-id-'+report.id)
  if $report.length == 0
    reportHTML = reportTpl(report)
    category = $('.category-id-'+report.service_report_category_id)
    count = category.find('.count')
    count.html parseInt(count.html()) + 1
    category.find('.reports').append(reportHTML).hide().slideDown()

