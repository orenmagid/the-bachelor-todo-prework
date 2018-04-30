require "pry"

def get_first_name_of_season_winner(data, season)
  data[season].each do |contestant_hash|
    contestant_hash.each do |key, value|
      if key == "status"
        if value == "Winner"
          return contestant_hash["name"].split(" ")[0]
        end
      end
    end
  end
end

def get_contestant_name(data, occupation)
  data.each do |seasons, array|
    array.each do |contestant_hash|
      contestant_hash.each do |key, value|
        if key == "occupation"
          if value == occupation
            return contestant_hash["name"]
          end
        end
      end
    end
  end
end

def count_contestants_by_hometown(data, hometown)
  ht_array = []
  data.each do |seasons, array|
    array.each do |contestant_hash|
      contestant_hash.each do |key, value|
        if key == "hometown"
          if value == hometown
            ht_array << hometown
          end
        end
      end
    end
  end
  return ht_array.length
end

def get_occupation(data, hometown)
  data.each do |seasons, array|
    array.each do |contestant_hash|
      contestant_hash.each do |key, value|
        if key == "hometown"
          if value == hometown
            return contestant_hash["occupation"]
          end
        end
      end
    end
  end
end

def get_average_age_for_season(data, season)
  age_array = []
  sum = 0

    data.each do |seasons, array|
      if seasons == season
        array.each do |contestant_hash|
          contestant_hash.each do |key, value|
            if key == "age"
              age_array << contestant_hash["age"].to_f

            end
          end
        end
      end
    end
    age_array.each { |a| sum = sum + a }
  average = sum / age_array.length
  average.round

end
