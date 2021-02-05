require 'pry'
require 'json'
file = File.read('./spec/fixtures/contestants.json')
contestants = JSON.parse(file)


def get_all_contestants(data)
  data.values.flatten 
end


def get_first_name_of_season_winner(data, season)
  matching_contestant = data[season].find do |contestant|
    contestant["status"] == "Winner"
  end
  matching_contestant["name"].split[0]
end

  # matching_contestant = get_all_contestants(data).find do |contestant|
  #   contestant["occupation"] == occupation
  # end
  # matching_contesant["name"]

def get_contestant_name(data, occupation)
  matching_contestant = get_all_contestants(data).find do |contestant|
    contestant["occupation"] == occupation
    end
    matching_contestant["name"]
end

# get_all_contestants(data).reduce(0) do |count, contestant|
#   if contestant["hometown"] == hometown
#     count + 1
#   else
#     count
#   end
# end
# end

# get_all_contestants(data).filter do |contestant| 
#   contestant["hometown"] == hometown
# end 
# contestants = get_all_contestants(data)
# contestants.filter { |contestant|contestant["hometown"] == hometown}.length

def count_contestants_by_hometown(data, hometown)
  contestants_by_hometown = get_all_contestants(data).filter do |contestant|
    contestant["hometown"] == hometown
  end
  contestants_by_hometown.length 
end

def get_occupation(data, hometown)
  contestant_by_occupation = get_all_contestants(data).find do |contestant|
    contestant["hometown"] == hometown
  end
  contestant_by_occupation["occupation"]
end

def get_average_age_for_season(data, season)
  sum_of_all_contestants_ages = data[season].sum do |contestant|
    contestant["age"].to_f
  end
  all_ages_of_contestants = data[season].length
  (sum_of_all_contestants_ages/all_ages_of_contestants).round
end



# binding.pry
# 0 

