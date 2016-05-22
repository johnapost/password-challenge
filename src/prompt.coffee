rl = require('readline').createInterface process.stdin, process.stdout

# Take tweet input and pass it to callback
prompt = (cb) ->
  rl.question 'Tweet a password -> ', (ans) ->
    cb ans
    rl.close()
    process.stdin.destroy()

module.exports = prompt
