class Computer
	attr_accessor :right_right_colour_position, :right_colour_wrong_place, :wrong_place_and_colour, :code
	def initialize
		@code = []
		@options = ["blue","yellow","red","green","purple","pink","white","black"]
		@right_right_colour_position = 0
		@right_colour_wrong_place = 0
		@wrong_place_and_colour = 0
	end
#<><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><>
#ssecret code is generated.

	def generate_numbers
		@code =[]

	  4.times do
		gen = rand(7)
		@code.push(@options[gen])
	  end
	return @code
	end
#<><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><>

private
	def print_choices
		@options.each do
		  
		  |colour| 
			if colour == "black"
			  print "#{colour} |\n"
		    else
			  print "#{colour} | "
		  end
		end
	end
#<><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><>
#checks if the user choice is in the the choices array, ie. is it a valide entry.
	def guess_in_array(x)
		  if @options.include?(x)
		  	return true
		  else
		      puts "This was not a valid color please choice again"
		  end
	end
#<><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><>
#this is the tricky part, this makes a duplicate of the guess and the generated code.
#it then checks if any of the geues is a direct match if so it changes the guess entry
#to checked. This then passes the sample array again through to look through as right colour wrong position match.
	def check_user_guess(arr)
		samplecode = @code.dup
		sampleguess = arr.dup
		
		sampleguess.each_with_index do
			|colour,i|
			if samplecode.include?(colour) == true && i == samplecode.find_index(colour)
				x =samplecode.find_index(colour)
				samplecode[x] = "checked"
				sampleguess[i] = "codematched"
				@right_right_colour_position += 1
			end
		end
	

		arr.each_with_index do
			|colour, i|
			if samplecode.include?(colour) == true
				@right_colour_wrong_place += 1
				
				 g = samplecode.find_index(colour)
				 samplecode[g] = "halfcheck"
			end
		end
		return samplecode
	end
#<><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><>

	def print_user_guess(arr)
		arr.each do
		  
		  |colour| 
			
			  print "#{colour} | "
		end
	end
#<><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><>
	def reset_counter
		@right_right_colour_position = 0
		@right_colour_wrong_place = 0
		@wrong_place_and_colour = 0
	end
#<><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><>
 	def return_results(arr)
 		puts "\nYOUR GUESS IS:" 
 		print_user_guess(arr)		
		puts "\nThe result of the guess are:"
		puts "#{@right_right_colour_position} of your guess are the the RIGHT color in the RIGHT position"
		puts "#{@right_colour_wrong_place} of your guess are the the RIGHT color in the WRONG position"
		@wrong_place_and_colour = 4 -(@right_right_colour_position + @right_colour_wrong_place)
		puts "#{@wrong_place_and_colour} of your guess just WRONG."
		
	end
#<><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><>
end
