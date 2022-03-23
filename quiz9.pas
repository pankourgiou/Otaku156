import random

class QA:
  def __init__(self, question, correctAnswer, otherAnswers):
    self.question = question
    self.corrAnsw = correctAnswer
    self.otherAnsw = otherAnswers

qaList = [QA("What is the name of fictional novel protagonist of Crime and punishment?", "Raskolnikov", ["Verkhovensky", "Ivan"]),
QA("Who is the writer of the novel  Crime and punishment?", "Dostoyevsky",[ "Orwell", "Murakami"]),
QA("Who is the writer of the novel Norwegian wood?", "Haruki Murakami", ["Karl Popper","Liu Cixin", "Tolstoy"]),
QA("Who is the writer of the novel Invisible cities?", "Italo Calvino", ["Umberto Eco", "Tolstoy"]),
QA("Who is the writer of the novel Through the Gates of the silver key?", "H.P. Lovecraft", ["J.K. Rowling", "Tolkien", "Haruki Murakami", "Neal Stephenson"])]

corrCount = 0
random.shuffle(qaList)
for qaItem in qaList:
  print(qaItem.question)
  print("Possible answers are:")
  possible = qaItem.otherAnsw + [qaItem.corrAnsw] # square brackets turn correct answer into list for concatenating with other list
  random.shuffle(possible)
  count = 0 # list indexes start at 0 in python
  while count < len(possible):
    print(str(count+1) + ": " + possible[count])
    count += 1
  print("Please enter the number of your answer:")
  userAnsw = input()
  while not userAnsw.isdigit():
    print("That was not a number. Please enter the number of your answer:")
    userAnsw = input()
  userAnsw = int(userAnsw)
  while not (userAnsw > 0 and userAnsw <= len(possible)):
    print("That number doesn't correspond to any answer. Please enter the number of your answer:")
    userAnsw = input()
  if possible[userAnsw-1] == qaItem.corrAnsw:
    print("Your answer was correct.")
    corrCount += 1
  else:
    print("Your answer was wrong.")
    print("Correct answer was: " + qaItem.corrAnsw)
  print("")

print("You answered " + str(corrCount) + " of " + str(len(qaList)) + " questions correctly.")
