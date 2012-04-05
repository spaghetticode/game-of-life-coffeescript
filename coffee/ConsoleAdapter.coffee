Game = require './Game'

class ConsoleAdapter
  constructor: (opts) ->
    @opts       = opts
    @iteration  = 0
    @iterations = opts.iterations || 100
    @game       = @initGame()
    @speed      = opts.speed || 100


  initialPattern: ->
    [[2,1], [2,2], [2,3], [1,3], [0,2]] #glider
#    [[1,2], [1,3], [1,4]] # oscillator

  play: ->
    id = setInterval (=>
      if @iteration >= @iterations
        clearInterval id
      else
        @redraw()
        @iteration += 1
      ), @speed

  redraw: ->
    console.log '\u001B[2J\u001B[0;0f'
    console.log @formatted()
    @game.tick()

  initGame: ->
    new Game(@opts.height, @opts.width, @initialPattern())

  formatted: ->
    rows = []
    for row in @game.board.board
      rows.push row.join('').replace(/0/g, ' ').replace(/1/g, '@')
    rows.join('\n')


module.exports = ConsoleAdapter
#window.ConsoleAdapter = ConsoleAdapter
