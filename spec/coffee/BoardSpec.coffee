Board = require '../../coffee/Board'

describe 'Board', ->
  alive = Board.LIVE
  dead  = Board.DEAD
  board = null

  beforeEach ->
    board = new Board(10, 20)

  it 'has expected width', ->
    expect(board.width).toBe 20

  it 'has expected height', ->
    expect(board.height).toBe 10

  describe '#initBoard', ->
    it 'sets expected number of rows', ->
      expect(board.board[0].length).toBe 20

    it 'sets expected number of columns', ->
      expect(board.board.length).toBe 10

  describe '#getValue', ->
    it 'returns cell value', ->
      expect(board.getValue(3, 1)).toBe dead

  describe '#setValue', ->
    it 'changes cell value', ->
      board.setValue(1, 3, 1)
      expect(board.getValue(1, 3)).toBe 1

  describe '#prevX', ->
    it 'is 0', ->
      expect(board.prevX(19)).toBe 18

    it 'is 19', ->
      expect(board.prevX(0)).toBe 19

    it 'is 18', ->
      expect(board.prevX(-1)).toBe 18

  describe '#nextX', ->
    it 'is 0', ->
      expect(board.nextX(19)).toBe 0

    it 'is 1', ->
      expect(board.nextX(0)).toBe 1

    it 'is 1', ->
      expect(board.nextX(20)).toBe 1

  describe '#neighbors', ->
    it 'has 8 items', ->
      expect(board.neighbors(3,1).length).toBe 8

    describe 'when coords are not at the border of the board', ->
      it 'returns expected coordinates', ->
        expected = [[0,1], [1,1], [2,1], [0,2], [2,2], [0,3], [1,3], [2,3]]
        expect(board.neighbors(1, 2)).toEqual expected

    describe 'when coords are at 0, 0', ->
      it 'returns expected coordinates', ->
        expected = [[9, 19], [0,19], [1,19], [9,0], [1,0], [9,1], [0,1], [1,1]]
        expect(board.neighbors(0, 0)).toEqual expected

    describe 'when coords are at 9, 19', ->
      it 'returns expected coordinates', ->
        expected = [[8,18], [9,18], [0,18], [8,19], [0,19], [8,0], [9,0], [0,0]]
        expect(board.neighbors(9, 19)).toEqual expected

  describe '#liveNeighborsCount', ->
    beforeEach ->
      board.setValue(1, 1, 1)
      board.setValue(2, 1, 1)
      board.setValue(3, 1, 1)

    describe 'when cell has 2 live neighbors', ->
      it 'returns 2', ->
        expect(board.liveNeighborsCount(0,0)).toBe 1

    describe 'when cell has no live neighbors', ->
      it 'returns 0', ->
        expect(board.liveNeighborsCount(5,5)).toBe 0

    describe 'when cell has 1 live neighbor', ->
      it 'returns 1', ->
        expect(board.liveNeighborsCount(4,1)).toBe 1
