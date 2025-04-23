# Random Number Game
# Solution to Seven Programming Languages in Seven Weeks Ruby - Day1 Self Study
# The game generates a random number from 1 to 10, then accepts a guess from
# the player, providing feedback to the player through the console.
# Initially this will be written to handle five guesses before a "Game Over!"
# J. J. Radler
# 2025-01-21

# add one to rand(9) to remove the zero-index offset since rand() includes 0.
# the_number = rand(9) + 1
#testprint

max_guesses = 5
guess_counter = max_guesses

the_number = rand(10) + 1

until guess_counter == 0
  puts "What's your guess?"
  guess = gets.to_i

  if guess == the_number
    puts "YOU GOT IT!"
    break
  else
    guess_counter = guess_counter - 1
    if guess > the_number
      puts "Too High!"
    else
      puts "Too Low!"
    end

    puts "#{guess_counter} tries left!" unless guess_counter == 0
    # guess_counter = guess_counter - 1
    next

  end
end

puts "Game Over!"
