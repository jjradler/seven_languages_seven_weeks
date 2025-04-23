// random_game.io
"Welcome to the Random Game. Guess a number from 1 to 100..." println

targetNumber := 79  // for a test. Cannot sort out library issues yet for Random

guessCount := 0
previousDiff := 0
currentDiff := 0

while(guessCount < 10,
    guess := File standardInput readLine("Enter Guess: ") asNumber
    guessCount = guessCount + 1
    currentDiff = (targetNumber - guess) abs
    if(guessCount == 1) then(previousDiff := currentDiff)

    if(currentDiff == 0) then("You got it!" println;break)
    if(currentDiff > previousDiff) then("Getting Colder..." println);
    if(currentDiff < previousDiff) then("Getting Warmer..." println);
    if(currentDiff == previousDiff) then(
        if(guessCount > 1) then("Same difference!" println) else("..." println))
    previousDiff := currentDiff
    write(10 - guessCount, " guesses remaining... Try again!\n")
)

"OK Bye!" println

