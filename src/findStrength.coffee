fs = require 'fs'
dictionary = fs.readFileSync('/usr/share/dict/words').toString().split '\n'
letters = 'abcdefghijklmnopqrstuvwxyz'.split ''

# TODO
# Recursively finds the longest words within a word
findLongest = (inputWord, length) ->
  if length is 1
    console.log inputWord
    return

  start = 0
  end = length
  foundWord = undefined
  words = []

  # Find all the word candidates
  while end <= inputWord.length
    words.push inputWord.slice start, end
    start++
    end++

  # Check for the first real word in the array
  for word in words
    if word in dictionary

      # Change word to random letter
      foundWord = word
      break


  # A word was successfully found
  if foundWord
    console.log "Word found: #{foundWord}"

    newWords = inputWord.split foundWord

    # Recursion
    for newWord in newWords
      findLongest newWord, length if newWord.length > 0

    return

  # No word was found, look for smaller words
  else
    findLongest inputWord, length - 1

# Replace complete English words in password with any lowercase letter
replaceWords = (password) ->
  current = password

  # Check that there are no more possible word candidates
  word = current.match /[A-Za-z]{2,}/

  # Change words to letters
  if word[0] in dictionary

    # Change word to random letter
    letter = letters[Math.floor(Math.random() * 26)]
    current = current.replace word, letter

  # Find actual words within this non-word
  else
    findLongest word[0], word[0].length

  console.log current

# Find 'character types' represented in the updated text
countTypes = (modifiedPass) ->
  types = 0
  if modifiedPass.match /[A-Za-z]/g
    types += 1
  if modifiedPass.match /[0-9]/g
    types += 1
  if modifiedPass.match /[ \t\n]/g
    types += 1
  if modifiedPass.match /[^A-Za-z0-9 \t\n]/g
    types += 1
  types

# Finds the strength of the password passed to it
findStrength = (password) ->
  modifiedPass = replaceWords password
  numTypes = countTypes modifiedPass

  # Multiply number of types by the length of the updated text
  strength = numTypes * modifiedPass.length

module.exports = replaceWords
