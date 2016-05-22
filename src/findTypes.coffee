# Find 'character types'
findTypes = (modifiedPass) ->
  types =
    alphabet: 0
    digit: 0
    whitespace: 0
    other: 0

  if modifiedPass.match /[A-Za-z]/g
    types.alphabet = modifiedPass.match(/[A-Za-z]/g).length
  if modifiedPass.match /[0-9]/g
    types.digit = modifiedPass.match(/[0-9]/g).length
  if modifiedPass.match /[ \t\n]/g
    types.whitespace = modifiedPass.match(/[ \t\n]/g).length
  if modifiedPass.match /[^A-Za-z0-9 \t\n]/g
    types.other = modifiedPass.match(/[^A-Za-z0-9 \t\n]/g).length

  types

module.exports = findTypes
