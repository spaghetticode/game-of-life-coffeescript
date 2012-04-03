class Board
  @LIVE = 1
  @DEAD = 0

  constructor: (height, width) ->
    @height = height
    @width  = width
    @board  = @initBoard()

  initBoard: ->
    rows = []
    for y in [1..@height]
      row = []
      for x in [1..@width]
        row.push Board.DEAD
      rows.push row
    rows

  getValue: (y, x) ->
    @board[y][x]

  setValue: (y, x, value) ->
    @board[y][x] = value

  neighbors: (y, x) ->
    prevX = @prevX(x)
    prevY = @prevY(y)
    nextX = @nextX(x)
    nextY = @nextY(y)
    [
      [prevY, prevX], [y, prevX], [nextY, prevX], [prevY, x],
      [nextY, x], [prevY, nextX], [y, nextX], [nextY, nextX]
    ]

  liveNeighborsCount: (y, x) ->
    count = 0
    for coords in @neighbors(y, x)
      x = if coords[1] >= 0 then coords[1] else @width-1
      y = if coords[0] >= 0 then coords[0] else @height-1
      count += 1 if @getValue(y, x) is Board.LIVE
    count

  prevX: (x) ->
    if x-1 >= 0 then x-1 else @width+x-1

  prevY: (y) ->
    if y-1 >= 0 then y-1 else @height+y-1


  nextX: (x) ->
    if x+1 >= @width then x+1-@width else x+1

  nextY: (y) ->
    if y+1 >= @height then y+1-@height else y+1

  toString: ->
    rows = []
    for row in @board
      rows.push row.join('').replace(/0/g, ' ').replace(/1/g, '@')
    rows.join('\n')

window.Board = Board
