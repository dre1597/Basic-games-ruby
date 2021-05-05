def welcome_message
    puts "******************************"
    puts "*Welcome to the guessing game*"
    puts "******************************"
end

def get_level
    puts "What level? (1 to 5) (1 easy, 5 hard)"
    gets.to_i
end

def get_secret_number level
    case level
    when 1
        max = 30
    when 2
        max = 60
    when 3 
        max = 100
    when 4
        max = 150
    else
        max = 200
    end

    puts "Choosing a secret number between 1 and #{max-1}..."
    sorted = rand(max) + 1
    puts "Perfect...what is the secret number?"

    sorted
end

def get_number guesses, try, limit
    puts "guess #{try} of #{limit}"
    puts "You tried #{guesses}"
    puts "Choose a number:"
    guess = gets.strip
    puts "Your guess is #{guess}"
    guess.to_i
end

def comparing_the_numbers secret_number, guess
    guessed = (guess == secret_number)

    if guessed
        puts "Guessed!"
        return true
    end

    greater = secret_number > guess

    if greater
        puts "Wrong! The secret number is greater!"
    else
        puts "Wrong! The secret number is lesser!"
    end
    
    false
end

def play level
    secret_number = get_secret_number level

    points = 1000

    limit = 10
    guesses = []

    for try in 1..limit
        guess = get_number guesses, try, limit
        guesses << guess

        points_to_lose = (guess - secret_number).abs / 2.0
        points -= points_to_lose

        break if comparing_the_numbers secret_number, guess
    end

    puts "You gain #{points} points"
end

def again?
    puts "Play again? (Y/N)"
    dont_want = gets.strip
    dont_want.upcase == "N"
end


welcome_message
level = get_level

loop do

    play(level)
    break if again?

end
