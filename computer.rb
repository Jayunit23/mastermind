class Computer
	attr_accessor :right_right_colour_position, :right_colour_wrong_place, :wrong_place_and_colour, :code
	def initialize
		@code = []
		@options = ["blue","yellow","red","green","purple","pink","white","black"]
		@right_right_colour_position = 0
		@right_colour_wrong_place = 0
		@wrong_place_and_colour = 0
	end

	def generate_numbers

	  4.times do
		gen = rand(7)
		@code.push(@options[gen])
	  end
	return @code
	end

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

	def guess_in_array(x)
		  if @options.include?(x)
		  	return true
		  else
		      puts "This was not a valid color please choice again"
		  end
	end

	def check_user_guess(arr)
		samplecode = @code.dup
		
		arr.each_with_index do
			|colour,i|
			if samplecode.include?(colour) == true && i == samplecode.find_index(colour)
				x =samplecode.find_index(colour)
				samplecode[x] = "checked"
				@right_right_colour_position += 1
			end
		end
		print samplecode

		arr.each_with_index do
			|colour, i|
			if samplecode.include?(colour) == true
				@right_colour_wrong_place += 1
				
				 g = samplecode.find_index(colour)
				 samplecode[g] ="halfcheck"
			end
		end
		return samplecode
	end


	def print_user_guess(arr)
		arr.each do
		  
		  |colour| 
			
			  print "#{colour} | "
		end
	end
	def reset_counter
		@right_right_colour_position = 0
		@right_colour_wrong_place = 0
		@wrong_place_and_colour = 0
	end

 	def return_results(arr)
 		puts "your guess is:"
 		print_user_guess(arr)
		puts "\nThe result of the guess are:"
		puts "#{@right_right_colour_position} of your guess are the the RIGHT color in the RIGHT position"
		puts "#{@right_colour_wrong_place} of your guess are the the RIGHT color in the WRONG position"
		puts "#{@wrong_place_and_colour} of your guess just WRONG."
		
	end



end
=begin
a=Computer.new
a.generate_numbers
a.check_user_guess(["blue","green","blue","red"])
a.return_results(["blue","green","blue","red"])
=end