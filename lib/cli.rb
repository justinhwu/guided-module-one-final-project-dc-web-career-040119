require "pry"
class CommandLineInterface

    @@customer_choices = {}

    def self.customer_choices
      @@customer_choices
    end

    #Starts Program
    def welcome_and_cuisine
      puts "Welcome to Got Noms! What is your name?"
      input = gets.chomp
      puts "Hi, #{input}! Are you in the mood for a specific type of cuisine? Type 'Y' for yes. If you do not have a cuisine preference, please enter 'N'."

       # What type of cuisine are you in the mood for? Please indicate your preference by typing in the corresponding number of your cuisine of choice!
    end

    #Gets user name
    # def get_user_input
    #   input = gets.chomp
    # end

    # #Asks User for cuisine
    # def choose_cuisine_message(input)
    #   puts "Hi, #{input}! What type of cuisine are you in the mood for? Please indicate your preference by typing in the corresponding number of your cuisine of choice!"
    #   puts "If you do not have a preference, please enter 'N'."
    # end

    #Outputs Cuisine choices
    def choices
      puts "1. Chinese"
      puts "2. Mexican"
      puts "3. American"
    end

    #Gets user to input corresponding number to cuisine type
    def get_preference_input
      input = gets.chomp
    end

    def get_neighborhood_input
      puts "Great! Would you like to further refine by neighborhood? If so, please enter 'Y'. If you are satisfied with your selection please enter 'N.'"
      #build iterator that will allow for further refinement, but if user selects "n" then will end loop and return list of restaurants.
    end

    def get_price_input
      puts "Great! Would you like to further refine by price? If so, please enter 'Y'. If you are satisfied with your selection please enter 'N.'"
      #build iterator that will allow for further refinement, but if user selects "n" then will end loop and return list of restaurants.
    end



    def yesorno
      stored_choice = ""
      loop do
        choice = gets.chomp.upcase
        if choice != "Y" && choice != "N"
          puts ("Please enter a valid option.")
        end
        stored_choice = choice
        break if choice == "Y" || choice =="N"
      end
      # if (choice != "Y".upcase && choice != "N".upcase)
      #   puts ("Please enter a valid option.")
      # end
      stored_choice
    end


    def neighborhood_choice
      puts "1. Dupont Circle"
      puts "2. Clarendon"
      puts "3. Metro Center"
    end

    def price_choice
      puts "$: $5-10"
      puts "$$: $10-20"
      puts "$$$: $20-30"
      puts "$$$$: $30+"
    end

    # def yesorno(input)
    #
    #   if input == "Y"
    #
    #
    #   end
    # end


    # #Finds corresonding restaurants to cuisine type
    # def find_cuisine(cuisine_num)
    #   #will need to udate cuisine_ids when we finalize the database ids
    #   #mexican
    #   if cuisine_num == Restaurant.find_by(cuisine_id: 11).cuisine_id
    #     mexican_restaurants = Restaurant.where("cuisine_id = 11")
    #
    #
    #     #american
    #   elsif cuisine_num == Restaurant.find_by(cuisine_id: 11).cuisine_id
    #       Restaurant.where("cuisine_id = 11").map do |names|
    #         names.name
    #       end
    #       #chinese
    #     elsif cuisine_num == Restaurant.find_by(cuisine_id: 11).cuisine_id
    #       Restaurant.where("cuisine_id = 11").map do |names|
    #         names.name
    #         #.... insert more cuisines as needed
    #       end
    #   else
    #     "No restaurants exist for that cuisine"
    #   end
    # end

    def run
      welcome_and_cuisine
      # input = get_user_input
      #Asks if user wants to choose a cuisine
      # choose_cuisine_message(input)
      #Method to give user choice to answer Y or N
      option = yesorno
      #Outputs choices
      if option == "Y"
        choices
        cuisine_num = get_preference_input.to_i
        @@customer_choices[:cuisine_id] = cuisine_num
      else
        @@customer_choices[:cuisine_id] = nil
      end

      #pushes choice to hash for customer_id


      #Asks user if they want to further refine their choice
      get_neighborhood_input
      #Conditional if user chooses to refine, will push option chosen into customer_choices hash
      option = yesorno
      if option == "Y"
        neighborhood_choice
        neighborhood_num = get_preference_input.to_i
        @@customer_choices[:neighborhood_id] = neighborhood_num
      else
        @@customer_choices[:neighborhood_id] = nil
      end

      get_price_input
      option = yesorno
      if option == "Y"
        price_choice
        price_num = get_preference_input.to_s
        @@customer_choices[:price_id] = price_num
      else
        @@customer_choices[:price_id] = nil
      end
      binding.pry
    end

end
