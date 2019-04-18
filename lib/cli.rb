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
      input = gets.chomp.to_s
      puts "Hi, #{input}! Are you in the mood for a specific type of cuisine? Type 'Y' for yes. If you do not have a cuisine preference, please enter 'N'."
    end

    #Provides user with cuisine choices
    def choices
      #will need to enter max. If user enters number not corresponding with list, prompt user again.
      puts "1. American"
      puts "2. Chinese"
      puts "3. Mexican"
      puts "4. Italian"
      puts "5. Thai"
      puts "6. Korean"
      puts "Please enter your choice!"
    end

    #Gets user to input corresponding number to cuisine type
    def get_preference_input
      stored_choice = ""
      loop do
        input = gets.chomp.to_i
        if input <1 || input>6
          puts ("That is not a valid option. Please choose again.")
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
        if input != "$" && input != "$$" && input != "$$$" && input != "$$$$"
          puts ("That is not a valid option. Please choose again.")
        end
        stored_choice = input
        break if input == "$" || input == "$$" || input == "$$$" || input == "$$$$"
      end
      stored_choice
    end


    def yesorno
      stored_choice = ""
      loop do
        choice = gets.chomp.upcase
        if choice != "Y" && choice != "N"
          puts ("That is not a valid option. Please choose again.")
        end
        stored_choice = choice
        break if choice == "Y" || choice =="N"
      end
      stored_choice
    end

    def get_neighborhood_input
      puts "Great! Would you like to further refine by neighborhood? If so, please enter 'Y'. If you are satisfied with your selection please enter 'N.'"
    end

    def ask_price_input
      puts "Great! Would you like to further refine by price? If so, please enter 'Y'. If you are satisfied with your selection please enter 'N.'"
    end

    def get_family_friendly_input
      # puts "Great! Would you like to refine your restaurant based on family friendliness? If so, please enter 'Y'. If family friendliness does not factor into your decision-making, enter 'N'."
      # puts "If you have no preference, please enter ''"
      puts "Great! Would you like to further refine by family-friendliness? Please enter 'Y' if you would like to refine your choices or enter 'N' if you are satisfied with all of your preferences"
    end

    def family_friendly_choice
      puts "Please enter '1' if you want a family friendly restaurnt. If you want a restaurant for just adults, please enter '0'"
      stored_choice = ""
      loop do
      input = gets.chomp.to_i
      if input != 1 && input != 0
        puts ("That is not a valid option. Please choose again.")
      end
      stored_choice = input
      break if input == 1 || input == 0
      end
      stored_choice
    end

    def neighborhood_choice
      puts "1. Gallery Place"
      puts "2. Dupont Circle"
      puts "3. Metro Center"
      puts "4. Clarendon"
      puts "5. Adams Morgan"
      puts "6. Cleveland Park"
      puts "Please enter your choice!"
    end

    def price_choice
      #limit to only enter dollar signs
      puts "$. $5-10"
      puts "$$. $10-20"
      puts "$$$. $20-30"
      puts "$$$$. $30+"
      puts "Please enter your choice!"
    end

    def get_restaurants(args = @@customer_choices, cuisine = @@cuisine_choices)
      Restaurant.where(args).select(restaurant_id: ?)
      # binding.pry
      # Restaurant.joins(:restaurant_cuisines.where(cuisine)
      # iterate through restaurants selecting for (args) THEN further iteration to find cuisine choices

    end


    # def match_rest_cuisine(args = @@cuisine_choices)
    #   RestaurantCuisines.pluck(args)
    # end

    def run
      welcome_and_cuisine
      option = yesorno
      if option == "Y"
        puts ("Are you in the mood for fusion food?")
        option = yesorno
      #If user says yes, then we will store 2 different cuisine types in an array
        if option == "Y"
          choices
          cuisine_num = get_preference_input.to_i
          # After user chooses preferred cuisines (either 1 or 2), search join table where restaurant_id == the 2
          @@cuisine_choices << cuisine_num
          puts("Please select another cuisine!")
          choices
          cuisine_num = get_preference_input.to_i
          @@cuisine_choices << cuisine_num
        else
          choices
          cuisine_num = get_preference_input.to_i
          @@cuisine_choices << cuisine_num
        end
      end


      # binding.pry

      #pushes choice to hash for customer_id

      #Asks user if they want to further refine their choice by neighborhood
      get_neighborhood_input
      #Conditional if user chooses to refine, will push option chosen into customer_choices hash
      option = yesorno
      if option == "Y"
        neighborhood_choice
        neighborhood_num = get_preference_input.to_i
        @@customer_choices[:neighborhood_id] = neighborhood_num
      # else
      #   @@customer_choices[:neighborhood_id] = nil
      end

      #asks user if they want to refine their choice by price
      ask_price_input
      option = yesorno
      if option == "Y"
        price_choice
        price_num = get_price_input
        @@customer_choices[:price] = price_num
      # else
      #   @@customer_choices[:price_id] = nil
      end

      get_family_friendly_input
        option = yesorno
        if option == "Y"
          choice = family_friendly_choice
          if choice == 1
            @@customer_choices[:family_friendly] = true
          else
            @@customer_choices[:family_friendly] = false
          end
        end
        puts "Thanks for using Get Noms!"
        get_restaurants
        binding.pry
    end
end
