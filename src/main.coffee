prompt = require './prompt.coffee'
findStrength = require './findStrength.coffee'
categorize = require './categorize.coffee'

init = ->

  # Retrieve password from the prompt
  prompt.open (password) ->
    strength = findStrength password
    category = categorize strength

    switch
      when category is 'Strong'
        console.log 'Great password!'
        prompt.close()

      when category is 'Weak'
        console.log 'Weak!'
        prompt.close()

      when category is 'Unacceptable'
        console.log 'You can do better than that, try again'
        init()

init()
