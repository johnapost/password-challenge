fs = require 'fs'

# TODO
# Finds the longest words within a word
findLongest = (word) ->
  dictionary = fs.readFileSync('/usr/share/dict/words').toString().split '\n'

  if word in dictionary
    console.log "#{word} is a word!"
  else
    console.log "#{word} is not a word.."

# TODO
# Replace complete English words in password with any lowercase letter
replaceWords = (password) ->
  wordCandidates = password.match /[A-Za-z]+/g
  findLongest word for word in wordCandidates

# Find 'character types' represented in the updated text
countTypes = (modifiedPass) ->
  types = 0
  if modifiedPass.match /[A-Za-z]+/g
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

module.exports = findLongest
