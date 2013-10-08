require 'hallon'

session = Hallon::Session.initialize IO.read('./spotify_appkey.key')
session.login!(ENV["SPOTIFY_USERNAME"], ENV["SPOTIFY_PASSWORD"])

playlist = Hallon::Playlist.new(ENV["SPOTIFY_LIST"])
total_time = playlist.tracks.map(&:duration)
total_time = tracks.map { |t| t.to_i }

if total_time.length > 0
  p total_time
  seconds = total_time.inject(:+)
  minutes_with_seconds = seconds / 60.00
  hours_with_minutes = (minutes_with_seconds / 60.00).round(2)
  puts "#{playlist.name} is currently #{hours_with_minutes.round(2)} long (HH.MM)"
else
  puts "Looks like your API called for some reason. Try again."
end