fs = require 'fs'

# TODO
# Finds the longest words within a word
findLongest = (word) ->
  console.log word

# TODO
# Replace complete English words in password with any lowercase letter
replaceWords = (password) ->
  return password

  wordCandidates = password.match /[A-Za-z]+/g
  findLongest word for word in wordCandidates

# Find 'character types' represented in the updated text
countTypes = (modifiedPass) ->
  types = 0
  types += modifiedPass.match(/[A-Za-z]+/g).length
  types += modifiedPass.match(/[0-9]/g).length
  types += modifiedPass.match(/[ \t\n]/g).length
  if modifiedPass.match /[^A-Za-z0-9 \t\n]/g
    types += modifiedPass.match(/[^A-Za-z0-9 \t\n]/g).length
  types

# Finds the strength of the password passed to it
findStrength = (password) ->
  modifiedPass = replaceWords password
  numTypes = countTypes modifiedPass

  console.log numTypes

  # Multiply number of types by the length of the updated text

module.exports = findStrength
