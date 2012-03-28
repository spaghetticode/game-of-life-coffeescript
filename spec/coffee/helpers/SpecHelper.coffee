beforeEach ->
  @addMatchers
    toBeSame: (expected) ->
      _.isEqual @actual, expected
