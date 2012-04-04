class Game
  @BORN = [3]
  @LIVE = [2,3]

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
    if @board.getValue(y, x) is Board.DEAD
      status = if Game.BORN.indexOf(count) >= 0 then Board.LIVE else Board.DEAD
    else
      status = if Game.LIVE.indexOf(count) >= 0 then Board.LIVE else Board.DEAD
    @newBoard.setValue(y, x, status)

  tick: ->
    @newBoard = new Board(@height, @width)
    for y in [0..@height-1]
      for x in [0..@width-1]
        @setNextStatus(y, x)
    @board = @newBoard

window.Game  = Game
