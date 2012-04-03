class Game
  constructor: (height, width, liveCells) ->
    @liveCells = liveCells
    @height    = height
    @width     = width
    @board     = new Board(@height, @width)
    @newBoard  = new Board(@height, @width)
    @initLiveCells()

  initLiveCells: ->
    for coord in @liveCells
      @board.setValue(coord[0], coord[1], Board.LIVE)

  setNextStatus: (y, x) ->
    count  = @board.liveNeighborsCount(y, x)
    status = if 2 <= count <= 3 then Board.LIVE else Board.DEAD
    @newBoard.setValue(y, x, status)

  tick: ->
    @newBoard = new Board(@height, @width)
    for y in [0..@height-1]
      for x in [0..@width-1]
        @setNextStatus(y, x)
    # Replace the old board with the new one

window.Game  = Game
