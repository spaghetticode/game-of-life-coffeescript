## Conway's Game of Life - Coffeescript

[![Build Status](https://secure.travis-ci.org/spaghetticode/game-of-life-coffeescript.png)](http://travis-ci.org/spaghetticode/game-of-life-coffeescript)

This is is my first attempt to build a coffeescript version of Conway's Game of
Life. It comes after my ruby version, so it will probably look like that one in
the end.

My goal for this funny exercise is to increase my confidence with TDD on
javascript.

I am trying to make it as modular as possible, the game in itself is contained
in the Game and Board classes, while the visualization is handled via adapters
such as the included ConsoleAdapter, so later I can develop more adapters
without cluttering the code in the game classes.


### Install

Run in terminal:
```bash
  npm install game-of-life
```


### Usage

```bash
  cd coffee && coffee index.coffee
```

### Specs

The game is tested with the jasmine framework. To run the specs in terminal just
run

```bash
  npm test
```
