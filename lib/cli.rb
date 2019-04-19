require "pry"
class CommandLineInterface

    @@customer_choices = {}
    @@cuisine_choices = []

    def self.customer_choices
      @@customer_choices
    end

    def self.cuisine_choices
      @@cuisine_choices
    end

    #Starts Program
    def welcome_and_cuisine
      puts "Welcome to Got Noms! What is your name?"
      input = gets.chomp
      puts "Hi, #{input}! Are you in the mood for a specific type of cuisine? Type 'Y' for yes. If you do not have a cuisine preference, please enter 'N'."
    end

    #Gets user to input corresponding number to cuisine type
    def get_preference_input
      stored_choice = ""
      loop do
        input = gets.chomp.to_i
        if input <1 || input>6
          puts ("That is not a valid option. Please choose a number between 1 and 6. Here are the options for your reference.")
        end
        stored_choice = input
        break if input<=6 && input>=1
      end
      stored_choice
    end

    def get_price_input
      stored_choice = ""
      loop do
        input = gets.chomp.to_s
        price_array = ["$", "$$", "$$$", "$$$$"]
        if !price_array.include?(input)
          # input != "$" && input != "$$" && input != "$$$" && input != "$$$$"
          puts ("That is not a valid option. Please input the '$' symbol in accordance with the provided options. Here are the options for your reference.")
          price_choice
        end
        stored_choice = input
        break if price_array.include?(stored_choice)
      end
      stored_choice.to_s
    end


    def yesorno
      stored_choice = ""
      loop do
        choice = gets.chomp.upcase
        if choice != "Y" && choice != "N"
          puts ("That is not a valid option. Please type 'Y' for YES and 'N' for NO.")
        end
        stored_choice = choice
        break if choice == "Y" || choice =="N"
      end
      stored_choice
    end

    def user_preference(num)
      preference_options = [ "neighborhood", "price", "family-friendliness" ]
      puts "Great! Would you like to further refine by #{preference_options[num]}? If so, please enter 'Y'. If you are satisfied with your selection please enter 'N.'"
    end

    def family_friendly_choice
      puts "Please enter '1' if you want a family friendly restaurant. If you want a restaurant for just adults, please enter '0'"
      stored_choice = ""
      loop do
      input = gets.chomp.to_i
      if input != 1 && input != 0
        puts ("That is not a valid option. Please type 'Y' for YES and 'N' for NO. Here are the options for your reference.")
      end
      stored_choice = input
      break if input == 1 || input == 0
      end
      stored_choice
    end

    def get_preference_names(table_name)
      table_name.all.map do |names|
        names.name
      end
    end

    def neighborhood_choice
      neighborhood_names = get_preference_names(Neighborhood)
      neighborhood_names.each_with_index do |names, index|
        puts "#{index+1}. #{names}"
      end
      puts "Please enter your choice!"
    end

    def get_price_values
      Restaurant.all.map do |names|
        names.price
      end.uniq.sort
    end

    def price_choice
      #limit to only enter dollar signs
      price_names = get_price_values
      price_points = ["$5-10", "$10-20", "$20-30", "$30+"]
      price_names.each_with_index do |names, index|
        puts "#{index+1}. #{names} #{price_points[index]}"
      end
      puts "Please enter your choice!"
    end

    #Provides user with cuisine choices
    def choices
      #will need to enter max. If user enters number not corresponding with list, prompt user again.
      cuisine_names = get_preference_names(Cuisine)
      cuisine_names.each_with_index do |names, index|
        puts "#{index+1}. #{names}"
      end
      puts "Please enter your choice!"
    end

    def get_restaurants(args = @@customer_choices, cuisines = @@cuisine_choices)

      if args.size != 0 || cuisines.size !=0
                first_rest_filter = Restaurant.where(args)


                rest_hash = {}
                first_rest_filter.each do |restaurant|
                  restaurant.cuisines.each do |ids|
                    if rest_hash.has_key?(restaurant.name)
                      rest_hash[restaurant.name] << ids.id
                    else
                      rest_hash[restaurant.name] = [ids.id]
                    end
                  end
                end

                rest_names = []
                rest_hash.each do |key, value|
                  if cuisines.size == 2 && value == cuisines || value == cuisines.reverse
                    rest_names << key
                  elsif cuisines.size == 1 && value.include?(cuisines.join.to_i)
                    # binding.pry
                    rest_names << key
                  end
                end
                # binding.pry
                if cuisines.size !=0 && first_rest_filter.size !=0 && rest_names.size != 0
                  rest_names.sort.each_with_index do |name, index|
                    puts "#{index+1}. #{name}"
                  end
                elsif cuisines.size == 0
                  no_cuisine = first_rest_filter.map do |object|
                    # binding.pry
                    object.name
                  end.sort
                  list = no_cuisine.each_with_index do |name, index|
                    puts "#{index+1}. #{name}"
                  end
                  return list
                else
                  puts ("There were no restaurants matching your criteria! Please try again.")
                end

      else
        list = get_preference_names(Restaurant).sort.each_with_index do |list_name, index|
          puts "#{index+1}. #{list_name}"
        end
        list
      end


    end

    def choosing_cuisines
      cuisine_perference = yesorno
      if cuisine_perference == "Y"
        puts ("Are you in the mood for fusion food? Please type 'Y' for YES and 'N' for NO.")
          fusion_decision = yesorno
      #If user says yes, then we will store 2 different cuisine types in an array
        if fusion_decision == "Y"
          choices
          cuisine_num = get_preference_input.to_i
          # After user chooses preferred cuisines (either 1 or 2), search join table where restaurant_id == the 2
          @@cuisine_choices << cuisine_num
          puts("Please select another cuisine!")
          choices
          second_cuisine_num = ""
          loop do
             input = get_preference_input.to_i
             if input == cuisine_num
               puts("You have already chosen that cuisine. Please select a different cuisine.")
             end
             second_cuisine_num = input
             break if input != cuisine_num
           end
          second_cuisine_num.to_i
          @@cuisine_choices << second_cuisine_num
        else
          choices
          cuisine_num = get_preference_input.to_i
          @@cuisine_choices << cuisine_num
        end
      end
    end

    def choosing_neighborhood
      #Asks user if they want to further refine their choice by neighborhood
      user_preference(0)
      #Conditional if user chooses to refine, will push option chosen into customer_choices hash
      option = yesorno
      if option == "Y"
        neighborhood_choice
        neighborhood_num = get_preference_input.to_i
        @@customer_choices[:neighborhood_id] = neighborhood_num
      end
    end

    def choosing_price
      user_preference(1)
      option = yesorno
      if option == "Y"
        price_choice
        price_num = get_price_input
        @@customer_choices[:price] = price_num
      end
    end

    def choosing_ff
      user_preference(2)
        option = yesorno
        if option == "Y"
          choice = family_friendly_choice
          if choice == 1
            @@customer_choices[:family_friendly] = true
          else
            @@customer_choices[:family_friendly] = false
          end
        end
    end

    def run
      welcome_and_cuisine

      choosing_cuisines

      choosing_neighborhood

      choosing_price

      choosing_ff

      get_restaurants
      puts "Thanks for using Get Noms!"

    end
end
