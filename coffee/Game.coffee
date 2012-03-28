class Game
  # cells are alive on the board when their value
  # is 1, dead when 0

  constructor: (width, height, liveCells) ->
    @liveCells = liveCells
    @width     = width
    @height    = height
    @board     = @initBoard()
    @setLiveCells()

  initBoard: ->
    rows = []
    for x in [1..@width]
      row = []
      for y in [1..@height]
        row.push 0
      rows.push row
    rows

  setLiveCells: ->
    for coords in @liveCells
      @board[coords[1]][coords[0]] = 1

  toString: ->
    rows = []
    for row in @board
      rows.push row.join('').replace(/0/g, ' ').replace(/1/g, '@')
    rows.join('\n')

window.Game = Game
