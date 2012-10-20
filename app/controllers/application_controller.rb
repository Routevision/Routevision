class ApplicationController < ActionController::Base
  protect_from_forgery

  private

  ###########################
  # API RENDERING UTILITIES #
  ###########################

  def render_json what, options = {}
    options = {}.merge options
    if what.nil?
      options[:json] = false
      options[:status] = 404
    else
      options[:json] = what
    end

    render options
  end

  #########################
  # FIND ENTITY UTILITIES #
  #########################

  def find_entity entity_class, entity_id
    if entity_id.nil?
      nil
    else
      entity = entity_class.find entity_id rescue nil
      entity.nil? ? false : entity
    end
  end

  def find_route route_id
    find_entity SfTransit::Route, route_id
  end

  def find_leg leg_id
    find_entity SfTransit::Leg, leg_id
  end

  def find_stop stop_id
    find_entity SfTransit::Stop, stop_id
  end
end
