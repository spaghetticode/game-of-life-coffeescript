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

usage:

```
  cd coffee && coffee index.coffee
```
