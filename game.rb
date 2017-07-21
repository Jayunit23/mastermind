class Game
		attr_accessor :guess_code
	load 'player.rb'
	load 'computer.rb'

	def initialize
		
		@player 
		@computer = Computer.new
		@guess_code =[]
		@win =["checked","checked","checked","checked"]
	end

	def welcome
		puts "Welcome to Mastermind the game of sheer brain power!"
		puts "The aim of the game is to guess the secret code in 12 guesses."
		puts "are you up for the challege?\n"
	end


	def get_name
		puts "\nHi Player what is your name: "
		gets.chomp
	end
	def enter_choice
     @computer.print_choices
     count = 1		
		  while count < 5
		    puts "Enter a colour for slot number #{count}"
		    guess_input = gets.chomp.downcase
		    if @computer.guess_in_array(guess_input) == true
			  @guess_code.push(guess_input)
		      p @guess_code
		      count += 1
		      p "count is #{count}"

		    end

		end

	end
	def check_win(results)
		win =["checked","checked","checked","checked"]
		if results == win
		puts "Winner Winner Chicken Dinner"
			return true
		end
	end
	def play_again
		puts "Press Y to play again, or any other key to quit."
		answer = gets.chomp.capitalize
			if answer == "Y"
			start_game
				
			else
				abort ("Thanks for Playing!")
			end
	end


	def reset_guess
		@guess_code = []
	end
	def start_game
		count = 1
		welcome()
		@player = Player.new(get_name)
		@computer.generate_numbers()
		while count < 13
		  enter_choice
		  results = @computer.check_user_guess(@guess_code)
		  @computer.return_results(@guess_code)
		  if check_win(results)
		  	play_again
		  end
		  reset_guess
		  @computer.reset_counter
		count += 1
		end
		puts "Sorry you loose"
		puts " the code was #{@computer.code}"
		play_again

	end

end

a=Game.new
a.start_game