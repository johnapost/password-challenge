categorize = (strength) ->
  switch
    when strength >= 50
      'Strong'
    when strength > 10
      'Weak'
    else
      'Unacceptable'

module.exports = categorize
