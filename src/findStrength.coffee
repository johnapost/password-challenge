fs = require 'fs'
dictionary = fs.readFileSync('/usr/share/dict/words').toString().split '\n'
letters = 'abcdefghijklmnopqrstuvwxyz'.split ''

# TODO
# Finds the longest words within a word
findLongest = (word, length) ->
  words = []

  if word in dictionary
    words.push word
  else
    words

  words

  # length = 3

  # start = 0
  # end = length

  # wordCandidates = []

  # # Find all the word candidates
  # while end <= word.length
  #   wordCandidates.push word.slice start, end
  #   start++
  #   end++

  # wordCandidates



# TODO
# Replace complete English words in password with any lowercase letter
replaceWords = (password) ->
  current = password

  # Check that there are no more possible word candidates
  while current.match /[A-Za-z]{2,}/
    word = current.match /[A-Za-z]{2,}/

    if word[0] in dictionary
      # Find random letter
      letter = letters[Math.floor(Math.random() * 26)]

      # Change word to random letter
      current = current.replace word, letter

    else
      findLongest word, word.length

  current

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
