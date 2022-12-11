import strutils
import std/sequtils
import std/math

type
  Elf = tuple[id: int, snack: int]

let file: File = open("./src/input.txt", FileMode.fmRead)

var snackId: int = 0
var snacks: seq[int]
var biggestElfs: seq[Elf]

defer:
  file.close()

for line in file.lines:
  if line.len > 0:
    if snacks.len <= snackId:
      snacks.add(0)
    snacks[snackId] += parseInt(line)
  else:
    snackId += 1

for elfId in countup(0, 2):
  var biggestElf: Elf = (id: 0, snack: 0)
  for i, snack in snacks:
    if snack > biggestElf.snack:
      biggestElf = (id: i, snack: snack)
  biggestElfs.add(biggestElf)
  snacks.delete(biggestElf.id)

echo "Biggest elfs: " & biggestElfs.join("")
echo "Total snacks: " & $biggestElfs.mapIt(it.snack).sum()
