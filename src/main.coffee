prompt = require './prompt.coffee'
findStrength = require './findStrength.coffee'

# First we retrieve password from the prompt
prompt (password) ->
  findStrength password
