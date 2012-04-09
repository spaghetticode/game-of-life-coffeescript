## Conway's Game of Life - Coffeescript

This is is my first attempt to build a coffeescript version of Conway's Game of
Life. It comes after my ruby version, so it will probably look like that one in
the end.

My goal for this funny exercise is to increase my confidence with TDD on
javascript.

I am trying to make it as modular as possible, the game in itself is contained
in the Game and Board classes, while the visualization is handled via adapters
such as the included ConsoleAdapter, so later I can develop more adapters
without cluttering the code in the game classes.

### Usage

```
  cd coffee && coffee index.coffee
```

### Specs

The game is tested with the jasmine framework. To run the specs you must install
the jasmine-node npm package, if you haven't already.

```
  npm install jasmine-node -g
  jasmine-node spec --coffee
```
