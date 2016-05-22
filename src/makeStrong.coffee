findStrength = require './findStrength.coffee'
findTypes = require './findTypes.coffee'
letters = 'abcdefghijklmnopqrstuvwxyz'.split ''
digits = '0123456789'.split ''
others = '~`!@#$%^&*()_+-={}[]:";\'<>?,./|\\'.split ''

# Returns a random character of type
randomCharacter = (replaceType) ->
  switch
    when replaceType is 'alphabet'
      char = letters[Math.floor(Math.random() * letters.length)]
    when replaceType is 'digit'
      char = digits[[Math.floor(Math.random() * digits.length)]]
    when replaceType is 'whitespace'
      char = ' '
    when replaceType is 'other'
      char = others[Math.floor(Math.random() * others.length)]

# Replaces a string's characters with types that aren't used as often
transform = (password, index, searchType, replaceType) ->

  # Ignore the already processed string
  if index is 0
    ignore = ''
  else
    ignore = password.slice(0, index)

  modify = password.slice index

  switch
    when searchType is 'alphabet'
      regex = /[A-Za-z]/
    when searchType is 'digit'
      regex = /[0-9]/
    when searchType is 'whitespace'
      regex = /[ \t\n]/
    when searchType is 'other'
      regex = /[^A-Za-z0-9 \t\n]/

  modify = modify.replace regex, randomCharacter(replaceType)
  transformed = ignore + modify

# Add random characters to a password in order to make it strong
lengthen = (password) ->
  while findStrength(password).value < 50
    replaceType = [
      'alphabet'
      'digit'
      'whitespace'
      'other'
    ][Math.floor(Math.random() * 4)]

    password += randomCharacter replaceType
  password

makeStrong = (password, types) ->
  newPass = password

  for i in [0..password.length - 1]
    types = findTypes newPass

    numTypes = 0
    for key, val of types
      numTypes++ if val > 0

    break if numTypes is 4

    sortedTypes = Object.keys(types).sort (a, b) -> types[a] - types[b]

    # Get the least used type
    searchType = sortedTypes.slice(-1)[0]
    replaceType = sortedTypes[0]

    newPass = transform newPass, i, searchType, replaceType

    # Return the new password immediately if it meets the criteria
    if findStrength(newPass).value >= 50
      return newPass

  # The password must be lengthened in order to make it strong
  lengthen newPass

module.exports = makeStrong
