require 'open-uri'
require 'json'
require_relative "models/restaurant"

module Fetcher

  def self.get_api(zip_code)
    JSON.parse(open("https://data.cityofnewyork.us/resource/xx67-kt59?zipcode=#{zip_code}").read)
  end

end


