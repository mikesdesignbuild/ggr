class EventsController < ApplicationController
  def index
    #@instances = @model.all.includes :event_type, :location, :boat   # not location_id
    @instances = @model.joins(:event_type, :location, :boat).includes(:event_type, :location, :boat).all
    cookies[:instance_ids] = @instances.map { |a| a.id }.join(',')
    #Rails.logger.debug("in index with: #{@instance}, #{@model}, #{@field_order}")
  end

end
