root._ = require 'underscore'

class root.Tile
  @types: ['Water', 'Grass']

  constructor: (@type) ->
    throw 'tile must have a type' unless @type?
    unless _.contains Tile.types, @type
      throw 'tile must be water or grass'
