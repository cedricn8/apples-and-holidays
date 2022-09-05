require 'pry'

def second_supply_for_fourth_of_july(holiday_hash)
  # given that holiday_supplies hash looks like this:
  # {
  #   :winter => {
  #     :christmas => ["Lights", "Wreath"],
  #     :new_years => ["Party Hats"]
  #   },
  #   :summer => {
  #     :fourth_of_july => ["Fireworks", "BBQ"]
  #   },
  #   :fall => {
  #     :thanksgiving => ["Turkey"]
  #   },
  #   :spring => {
  #     :memorial_day => ["BBQ"]
  #   }
  # }
  # return the second element in the 4th of July array
  holiday_hash[:summer][:fourth_of_july][1]
end

def add_supply_to_winter_holidays(holiday_hash, supply)
  # holiday_hash is identical to the one above
  # add the second argument, which is a supply, to BOTH the
  # Christmas AND the New Year's arrays
  
  holiday_hash.each do |season, holiday_stuff_hash|
    if season == :winter
      holiday_stuff_hash.each do |holiday_key, stuff_array|
        stuff_array << supply
      end
    end 
  end
  
end


def add_supply_to_memorial_day(holiday_hash, supply)
  # again, holiday_hash is the same as the ones above
  # add the second argument to the memorial day array
  holiday_hash[:spring][:memorial_day] << supply
end

def add_new_holiday_with_supplies(holiday_hash, season, holiday_name, supply_array)
  # code here
  # remember to return the updated hash
  holiday_hash[season][holiday_name] = supply_array
end

def all_winter_holiday_supplies(holiday_hash)
  # return an array of all of the supplies that are used in the winter season
  holiday_hash[:winter].values.flatten
end

def all_supplies_in_holidays(holiday_hash)
  # iterate through holiday_hash and print items such that your readout resembles:
  # Winter:
  #   Christmas: Lights, Wreath
  #   New Years: Party Hats
  # Summer:
  #   Fourth Of July: Fireworks, BBQ
  # etc.
  
  holiday_hash.each do |season, holiday_stuff_hash|
    
    #season is the key of the main hash
    #holiday_stuff_hash is the season's value which is a hash of holiday key and related value of items in an array
    season_name = season.capitalize
    puts "#{season_name}:" 

    holiday_stuff_hash.each do |holiday_key, stuff_array|
      #holiday_key is the key and stuff_array of items is its value in array form
      
      #convert holiday_key from symbol format to string using .to_s, then if there are multiple words joined by "_", .split it into separate words 
      #which will be stored in a new array called holiday_key_array.  Then capitalize first letter of each word in that array.  
      holiday_key_array = holiday_key.to_s.split("_") 
      holiday_key_array.each {|item| item.capitalize!}
      
      #use .join to convert holiday_key_array of one word or multiple words into one string to be able to remove display of [] 
      #and to put space betweeen words if multi-word holiday_key_array.
      #note that the holiday_key_array will have only one item if one word, or multiple items if multiple words.
      holiday_key_string = holiday_key_array.join(" ")

      #use .join to be convert stuff_array of items into one string to be able to remove display of [] 
      #and to put comma and space betweeen items.
      stuff_array_string = stuff_array.join(", ")

      puts "  #{holiday_key_string}: #{stuff_array_string}"
    end

  end

end

def all_holidays_with_bbq(holiday_hash)

  # return an array of holiday names (as symbols) where supply lists
  # include the string "BBQ"
  # output should be: #=> [:fourth_of_july, :memorial_day]

  #Note: puts holiday_key only displays:
  #
  #  fourth_of_july
  #  memorial_day
  #  
  #  Must remove "puts" to be able to display contents in its natural content, the symbol form,
  #  in this case.
  #
  #  To suppress the nil values from being included in the returned array, must use shovel method to a
  #  new array and return the new array only. 
  bbq_array = []
  holiday_hash.each do |season, holiday_stuff_hash|
    holiday_stuff_hash.each do |holiday_key, stuff_array|
      if stuff_array.include?("BBQ")
        bbq_array << holiday_key
      end
    end
  end
  bbq_array
end







