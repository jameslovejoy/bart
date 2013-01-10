module ArrivalsHelper
  def temporal(stop_times)
    time_now = Time.now.strftime("%H:%M:%S")
    stop_times.delete_if {|st| st.arrival_time < time_now}
    stop_times.delete_if {|st| (trip = source.trips.find {|t| t.id == st.trip_id}) && trip.service_id != 'WKDY'}

    grouped = stop_times.group_by(&:stop_headsign)
    content_tag :ul do
      grouped.collect { |stop_headsign, stop_times| content_tag(:li, "#{stop_headsign}: #{stop_times.map(&:arrival_time).join(', ')}") }.join.html_safe
    end
  end
end
