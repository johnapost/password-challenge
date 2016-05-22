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
transform = (password, index) ->

  # Ignore the already processed string
  ignore = password.slice(0, index - 1)
  modify = password.slice index

  types = findTypes password
  sorted = Object.keys(types).sort (a, b) -> types[a] - types[b]

  # Get the least
  searchType = sorted.slice(-1)[0]
  replaceType = sorted[0]

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
  password += randomCharacter 'alphabet'

makeStrong = (password, types) ->
  newPass = password

  for i in [0..password.length - 1]
    newPass = transform newPass, i

    # Return the new password immediately if it meets the criteria
    if findStrength(newPass).value >= 50
      return newPass

  # The password must be lengthened in order to make it strong
  lengthen newPass

module.exports = makeStrong
