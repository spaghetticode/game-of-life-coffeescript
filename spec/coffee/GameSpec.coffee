describe 'Game', ->
  alive = Board.LIVE
  dead  = Board.DEAD
  game  = null

  beforeEach ->
    game = new Game(10, 20, [[1,1], [2,1], [3,1]])

  it 'has expected height', ->
    expect(game.height).toBe 10

  it 'has expected width', ->
    expect(game.width).toBe 20

  it 'has expected liveCells attribute', ->
    expect(game.liveCells).toEqual [[1,1], [2,1], [3,1]]

  it 'populates board with cells in expected positions', ->
    expect(game.board.board[1][1]).toBe alive
    expect(game.board.board[2][1]).toBe alive
    expect(game.board.board[3][1]).toBe alive

  it 'board has same items as newBoard', ->
    expect(game.board.length).toBe game.newBoard.length

  describe '#setNextStatus', ->
    it 'calls setValue on the newBoard', ->
      spyOn(game.newBoard, 'setValue')
      game.setNextStatus(7,8)
      expect(game.newBoard.setValue).toHaveBeenCalledWith(7,8,dead)

    describe 'when cell has less than 2 live neighbors', ->
      it 'dies', ->
        spyOn(game.board, 'liveNeighborsCount').andReturn 1
        game.setNextStatus(0,4)
        expect(game.newBoard.board[0][4]).toBe dead

    describe 'when cell has 2 live neighbors', ->
      it 'lives', ->
        spyOn(game.board, 'liveNeighborsCount').andReturn 2
        game.setNextStatus(0,1)
        expect(game.newBoard.getValue(0,1)).toBe alive

    describe 'when cell has 3 live neighbors', ->
      it 'lives', ->
        spyOn(game.board, 'liveNeighborsCount').andReturn 3
        game.setNextStatus(1,5)
        expect(game.newBoard.getValue(1,5)).toBe alive

    describe 'when cell has more than 3 live neighbors', ->
      it 'lives', ->
        spyOn(game.board, 'liveNeighborsCount').andReturn 4
        expect(game.setNextStatus(2,2)).toBe dead

    describe '#tick', ->
      it 'make expected cells live', ->
        game.tick()
        expect(game.newBoard.getValue(2,0)).toBe alive
        expect(game.newBoard.getValue(2,1)).toBe alive
        expect(game.newBoard.getValue(2,2)).toBe alive

      it 'make expected cells dead', ->
        game.tick()
        expect(game.newBoard.getValue(1,1)).toBe dead
        expect(game.newBoard.getValue(3,1)).toBe dead
