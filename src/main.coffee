prompt = require './prompt.coffee'
findStrength = require './findStrength.coffee'
categorize = require './categorize.coffee'

# First we retrieve password from the prompt
prompt (password) ->
  strength = findStrength password
  category = categorize strength

  console.log "Your password score of #{strength} is #{category}"
