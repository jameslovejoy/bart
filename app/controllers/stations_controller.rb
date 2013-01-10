class StationsController < ApplicationController
  def index
    @stations = source.stops
  end
end
