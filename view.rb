
module View

  def self.welcome
    puts "HUNGRY????"
    puts "What is your zipcode?"
  end

  def self.get_input
    gets.chomp
  end

  def self.no_restaurants
    puts "Sorry we couldn't find a restaurant near you."
  end

end


