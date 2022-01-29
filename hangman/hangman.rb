require_relative "ui"

def get_secret_word
  chossing_message
  text = File.read("./words.txt")
  all_words = text.split "\n"
  random_number = rand(all_words.size)
  secret_word = all_words[random_number].downcase
  chossed_message secret_word
  secret_word
end

def masked_word(guesses, secret_word)
  mask = ""

  for letter in secret_word.chars
    if guesses.include? letter
      mask << letter
    else
      mask << "_"
    end
  end
  mask
end

def get_valid_guess(guesses, errors, mask)
  try_message guesses, errors, mask

  loop do
    guess = get_guess guesses

    if guesses.include? guess
      guessed_message guess
    else
      return guess
    end
  end
end

def play
  secret_word = get_secret_word

  errors = 0
  guesses = []
  points = 0

  while errors < 5
    mask = masked_word guesses, secret_word
    guess = get_valid_guess guesses, errors, mask
    guesses << guess

    guessed_letter = guess.size == 1

    if guessed_letter
      letter = guess[0]
      total_finded = secret_word.count letter

      if total_finded == 0
        not_finded_message
        errors += 1
      else
        finded_message total_finded
      end
    else
      guessed = guess == secret_word
      if guessed
        correct_message
        points += 100
        break
      else
        miss_message
        points -= 30
        errors += 1
      end
    end
  end

  points_message points
  points
end

def hangman
  welcome_message
  total_points = 0

  loop do
    total_points += play
    total_points_message total_points

    if play_again?
      break
    end
  end
end
