def welcome_message
  puts "Welcome to the hangman game!"
end

def chossing_message
  puts "Choosing a secret word..."
end

def chossed_message(secret_word)
  puts "The secret word have #{secret_word.size} letters... Good luck!"
end

def try_message(guesses, errors, mask)
  puts "\n\nSecret Word: #{mask}"
  puts "Missed: #{errors}"
  puts "Tried: #{guesses}"
end

def get_guess(guess)
  puts "Choose a letter or a word"
  guess = gets.strip.downcase
  puts "You choosed #{guess}"
  guess
end

def guessed_message(guess)
  puts "You tried #{guess}"
end

def not_finded_message
  puts "Wrong letter!"
end

def finded_message(total_finded)
  puts "We have #{total_finded} of this letter"
end

def correct_message
  puts "Gratz! You got it! :)"
end

def miss_message
  puts "You missed :/"
end

def points_message(points)
  puts "You scored #{points} points"
end

def total_points_message(points)
  puts "You scored #{points} points in total"
end

def play_again?
  puts "Play Again? (Y/N)"
  play = gets.strip
  play.upcase == "N"
end
