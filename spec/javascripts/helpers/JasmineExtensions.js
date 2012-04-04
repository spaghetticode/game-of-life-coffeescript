(function() {

  beforeEach(function() {
    return this.addMatchers({
      toBeInstanceOf: function(expected) {
        return this.actual instanceof expected;
      }
    });
  });

}).call(this);
