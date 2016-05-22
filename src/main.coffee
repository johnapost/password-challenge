prompt = require './prompt.coffee'
findStrength = require './findStrength.coffee'
categorize = require './categorize.coffee'
makeStrong = require './makeStrong.coffee'

init = ->

  # Retrieve password from the prompt
  prompt.open (password) ->
    if password.length is 0
      console.log '\nPlease enter a password'
      return init()

    strength = findStrength password
    category = categorize strength.value

    switch
      when category is 'Strong'
        console.log '\nGreat password!'
        prompt.close()

      when category is 'Weak'
        newPass = makeStrong password, strength.types
        console.log "\nWhy not try the following:\n#{newPass}"
        prompt.close()

      when category is 'Unacceptable'
        console.log '\nYou can do better than that, try again.'
        init()

init()
