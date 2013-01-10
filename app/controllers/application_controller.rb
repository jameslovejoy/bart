class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :build_source
  
  private

  def source
    @source
  end

  def build_source
    @source ||= GTFS::Source.build('lib/bart-2012-09-10.zip')
  end
end
