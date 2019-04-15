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
    # def get_

    def run
      welcome
      input = get_user_input
      puts "Hi, #{input}! What type of cuisine are you in the mood for? Please indicate your preference by typing in the corresponding number of your cuisine of choice!"
      choices
      cuisine = get_cuisine_input
      puts "Great Choice"

    end

end
