class exports.Figure
  constructor: (@power) ->
    unless 0 <= @power <= 11
      throw 'figure power must be 0-11'
    @dead = false

  placeOn: (tile) ->
    if tile not instanceof Tile
      throw 'figure must be placed on tile'

    if tile.type == 'Water'
      throw 'figure cannot be placed on water'

    @tile = tile

  fight: (figure) ->
    if @dead or figure.dead
      throw "dead can't fight"

    @kill figure if @strongerThan figure

    figure.kill @ if @weakerThan figure
    
    if @samePowerAs figure
      @kill figure
      figure.kill @

  strongerThan: (figure) ->
    #return false if @is_mine() && figure.is_sapper()
    @power > figure.power

  #TODO: mines, sappers
  weakerThan: (figure) ->
    figure.strongerThan @

  samePowerAs: (figure) ->
    @power == figure.power

  kill: (figure) ->
    figure.die()

  die: ->
    @dead = true
