require_relative "fetch_file"
require_relative "view"



class WorstRestaurants

  def self.ordered_restaurants file
    get_unique_restaurants(file).sort_by { |restaurant| restaurant.score.to_i}
  end

  def self.get_unique_restaurants file
    create_restaurants(file).uniq {|restaurant| restaurant.restaurant_id }
  end

  def self.create_restaurants file
    @rest_objects = file.map { |rest_hash| Restaurant.new(rest_hash)}
  end

  def self.find_worst file
    ordered_restaurants(file).last
  end


end


View.welcome
input = View.get_input
the_restaurants = []
count = 0
while the_restaurants.empty? && count < 5
  the_restaurants = Fetcher.get_api(input)
  input = input.succ
  count += 1
  View.no_restaurants if count == 5
end
puts WorstRestaurants.find_worst the_restaurants


