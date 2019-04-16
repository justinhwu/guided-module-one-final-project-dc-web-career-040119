require "pry"
class CommandLineInterface


    def welcome
      puts "Welcome to Got Noms! What is your name?"
    end

    def get_user_input
      input = gets.chomp
    end

    def choices
      puts "8. Chinese"
      puts "2. Mexican"
      puts "3. American"
    end

    def get_cuisine_input
      input = gets.chomp
    end
    # def get_

    def run
      welcome
      input = get_user_input
      puts "Hi, #{input}! What type of cuisine are you in the mood for? Please indicate your preference by typing in the corresponding number of your cuisine of choice!"
      choices
      cuisine_num = get_cuisine_input.to_i
      puts "Great Choice"
      #Convert cuisie_id to the associated number chosen by user
      puts (find_chinese(cuisine_num))

      end

    def find_chinese(cuisine_num)

      if cuisine_num == Restaurant.find_by(cuisine_id: 11).cuisine_id
        Restaurant.where("cuisine_id = 11").map do |names|
          names.name
        end
      else
        "No restaurants exist for that cuisine"
      end

    end

end
