describe 'ConsoleAdapter', ->
  adapter = null

  beforeEach ->
    adapter = new ConsoleAdapter(width: 20, height: 10, iterations: 10)

  it 'assings iterations', ->
    expect(adapter.iterations).toBe 10

  it 'assings iteration', ->
    expect(adapter.iteration).toBe 0

  it 'assings speed to a', ->
    expect(adapter.speed).toBe 100

  describe '#initialPattern', ->
    it 'returns expected array', ->
      expect(adapter.initialPattern()).toEqual [[2,1], [2,2], [2,3], [1,3], [0,2]]

  describe '#initGame', ->
    it 'returns a game instance', ->
      expect(adapter.initGame()).toBeInstanceOf Game

  describe '#redraw', ->
    it 'make game tick', ->
      spyOn(adapter.game, 'tick')
      adapter.redraw()
      expect(adapter.game.tick).toHaveBeenCalled()

    it 'outputs to the console', ->
      spyOn(console, 'log')
      adapter.redraw()
      expect(console.log).toHaveBeenCalled()

  describe '#formatted', ->
    it 'returns a string', ->
      expect(typeof adapter.formatted()).toBe 'string'

    it 'has expected length', ->
      expect(adapter.formatted().replace(/\n/g, '').length).toBe 200
