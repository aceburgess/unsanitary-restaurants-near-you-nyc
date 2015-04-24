require_relative "../fetch_file"
require 'date'
require 'colorize'
class Restaurant

  attr_reader :name, :building_number, :street, :zip_code, :restaurant_id, :score, :date, :violation
  def initialize args = {}
    @name = args["dba"].downcase.split(" ").map(&:capitalize).join(" ")
    @building_number = args["building"]
    @street = args["street"].downcase.split(" ").map(&:capitalize).join(" ")
    @zip_code = args["zipcode"]
    @restaurant_id = args["camis"]
    @score = args["score"].to_i
    @date = convert_date args["grade_date"]
    @violation = args["violation_description"]
  end

  def to_s
    "Try eating at #{name}.\nIt is located at #{building_number.strip} #{street}. \nThey got a #{score} on their #{date || "last"} inspection.\nThat tranlates to a #{score_to_letter} rating.\nThe inspectors found #{violation.downcase} \nYummy."
  end

  def convert_date date_string
    return date_string if date_string == nil
    DateTime.parse(date_string).year
  end

  def score_to_letter
    case
    when score <= 13 then return pretty_print("A", :green)
    when score <= 27 then return pretty_print("B", :blue)
    when score <= 41 then return pretty_print("C", :red)
    else return pretty_print("PLEASE DON'T EAT HERE", :red)
    end
  end

  def pretty_print(string, color)
    string.colorize(color).blink
  end
end
