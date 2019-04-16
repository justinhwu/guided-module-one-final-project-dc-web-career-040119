require "pry"
class CommandLineInterface


    def welcome
      puts "Welcome to Got Noms! What is your name?"
    end

    def get_user_input
      input = gets.chomp
    end

    def choices
      puts "1. Chinese"
      puts "2. Mexican"
      puts "3. American"
    end

    def get_cuisine_input
      input = gets.chomp
    end

    def choose_cuisine(input)
      puts "Hi, #{input}! What type of cuisine are you in the mood for? Please indicate your preference by typing in the corresponding number of your cuisine of choice!"
    end

    def great_choice
      puts "Great choice! Would you like to further refine your options? If not, enter 'N'."
      #build iterator that will allow for further refinement, but if user selects "n" then will end loop and return list of restaurants.
    end

    def neighborhood_choice

    end

    def run
      welcome
      input = get_user_input
      choose_cuisine(input)
      choices
      cuisine_num = get_cuisine_input.to_i
      great_choice
      #Convert cuisie_id to the associated number chosen by user
      (find_cuisine(cuisine_num))
      refine_choice_by

      end

    def find_cuisine(cuisine_num)
      #will need to udate cuisine_ids when we finalize the database ids
      #mexican
      if cuisine_num == Restaurant.find_by(cuisine_id: 5).cuisine_id
        Restaurant.where("cuisine_id = 5").map do |names|
          names.name
        end
        #american
        elsif cuisine_num == Restaurant.find_by(cuisine_id: 5).cuisine_id
          Restaurant.where("cuisine_id = 5").map do |names|
            names.name
          end
          #chinese
        elsif cuisine_num == Restaurant.find_by(cuisine_id: 5).cuisine_id
          Restaurant.where("cuisine_id = 5").map do |names|
            names.name
            #.... insert more cuisines as needed
          end
      else
        "No restaurants exist for that cuisine"
      end
    end

end
