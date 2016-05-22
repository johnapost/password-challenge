rl = require('readline').createInterface process.stdin, process.stdout

# Take tweet input and pass it to callback
open = (cb) ->
  rl.question 'Tweet a password -> ', (ans) ->
    cb ans

# Close the input
close = ->
  rl.close()
  process.stdin.destroy()

module.exports =
  open: open
  close: close
