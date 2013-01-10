class ArrivalsController < ApplicationController
  def index
    @stops = source.stops
  end

  private

  def stop_times
    unless st = Rails.cache.read("stop_times")
      st = source.stop_times.group_by(&:stop_id)
      Rails.cache.write("stop_times", st)
    end
    st
  end
  helper_method :stop_times
end
