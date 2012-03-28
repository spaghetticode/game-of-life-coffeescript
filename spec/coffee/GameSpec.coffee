describe 'Game', ->
  game = null

  beforeEach ->
    game = new Game(10, 20, [[1,2], [1,1]])

  it 'has expected height', ->
    expect(game.height).toBe 20

  it 'has expected width', ->
    expect(game.width).toBe 10

  it 'has expected liveCells attribute', ->
    expect(game.liveCells).toBeSame [[1,2], [1,1]]

  it 'populates board with cells in expected positions', ->
    expect(game.board[1][1]).toBe 1
    expect(game.board[2][1]).toBe 1

  describe '#toString', ->
    it 'returns a string', ->
      expect(typeof game.toString()).toBe 'string'

    it 'has expected length', ->
      expect(game.toString().replace(/\n/g, '').length).toBe 200

  describe '#initBoard', ->
    it 'has expected columns', ->
      expect(game.board.length).toBe 10

    it 'has expected rows', ->
        expect(game.board[0].length).toBe 20
