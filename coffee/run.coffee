class Game
  load: ->
  tick: ->

redraw = ->
  console.log '\u001B[2J\u001B[0;0f'
  console.log game.toString
  @game.tick()

play = (iterations) ->
  @game = new Game(iterations)
  @game.load [2,1], [2,2], [2,3], [1,3], [0,2]

  n = 0
  id = setInterval (->
    if n >= iterations
      clearInterval id
    else
      redraw()
    ), 300

# play(100)
