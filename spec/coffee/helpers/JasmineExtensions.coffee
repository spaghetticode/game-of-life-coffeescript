beforeEach ->
  @addMatchers
    toBeInstanceOf: (expected) ->
      @actual instanceof expected
