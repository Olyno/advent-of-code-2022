let file: File = open("./src/input.txt", FileMode.fmRead)

type
  Result = enum
    LOSE = 0
    DRAW = 3
    WIN = 6
  Play = enum
    ROCK = 1
    PAPER = 2
    SCISSORS = 3

proc getResult(line: string): int =
  let
    player1 = line[0]
    player2 = line[2]
  if player1 == 'A' and player2 == 'X':
    result = ord(Result.DRAW) + ord(Play.ROCK)
  elif player1 == 'A' and player2 == 'Y':
    result = ord(Result.WIN) + ord(Play.PAPER)
  elif player1 == 'A' and player2 == 'Z':
    result = ord(Result.LOSE) + ord(Play.SCISSORS)
  elif player1 == 'B' and player2 == 'X':
    result = ord(Result.LOSE) + ord(Play.ROCK)
  elif player1 == 'B' and player2 == 'Y':
    result = ord(Result.DRAW) + ord(Play.PAPER)
  elif player1 == 'B' and player2 == 'Z':
    result = ord(Result.WIN) + ord(Play.SCISSORS)
  elif player1 == 'C' and player2 == 'X':
    result = ord(Result.WIN) + ord(Play.ROCK)
  elif player1 == 'C' and player2 == 'Y':
    result = ord(Result.LOSE) + ord(Play.PAPER)
  elif player1 == 'C' and player2 == 'Z':
    result = ord(Result.DRAW) + ord(Play.SCISSORS)
  return

defer:
  file.close()

var totalScore: int = 0

for line in file.lines:
  totalScore += getResult(line)

echo "Total score: " & $totalScore
