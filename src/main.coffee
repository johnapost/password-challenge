prompt = require './prompt.coffee'
findStrength = require './findStrength.coffee'

# First we retrieve password from the prompt
prompt (password) ->
  console.log password

  findStrength password
