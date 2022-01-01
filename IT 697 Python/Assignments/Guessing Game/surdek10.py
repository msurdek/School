import random

#set parameters for game
guesses = 8
min = -100
max = 100

target = random.randrange(min, max, 1)

#set the stage and receive username
print("Let's play a guessing game.")
print("I am thinking of a number between %d and %d." % (min, max))
print("I will give you %d guesses (plus hints) to see if you can guess it." % guesses)
username = input("First, create a username: ")
guesses_remaining = guesses
guess = int()

#runs the game allowing the user to guess until they are correct or run out of tries
while guesses_remaining > 0 and guess != target:
    guess = int(input("Alright, %s, you have %d guesses left. What number am I thinking of?" % (username, guesses_remaining)))
    if guess == target:
        print("Congratulations, that is correct!")
        guesses_remaining = guesses_remaining - 1
    elif guess > target:
       print("Your guess was too high.")
       guesses_remaining = guesses_remaining - 1
    else:
      print("Your guess was too low.")
      guesses_remaining = guesses_remaining - 1

#counts the total number of gueses
total_guesses = guesses - guesses_remaining

#let's the user know if they failed and creates new result variable
if total_guesses == guesses and guess != target:
    print("That was your last try. You were not able to guess the number I am thinking of.")
    correct_guess = False
else:
    correct_guess = True

#concatnate a string with the results for output to a file
output = username + ", " + str(total_guesses) + ", " + str(correct_guess)

#adds output string and new line to a results file
file = open("guessing_game_results.txt", 'a')
file.write(output)
file.write('\n')