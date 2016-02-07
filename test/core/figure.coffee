core = require './app/core.js'
Figure = core.Figure

test 'figure', (assert) ->
  figure = new Figure 10
  enemy = new Figure 6
  grass = new Tile 'Grass'
  water = new Tile 'Water'

  assert.ok !figure.dead,
    'is alive'

  figure.placeOn grass
  assert.equal figure.tile, grass,
    'can be placed on grass'

  assert.throws (-> figure.placeOn water),
    /cannot be placed on water/

  assert.throws (-> figure.placeOn 'Shit'),
    /must be placed on tile/

  assert.ok figure.power == 10,
    'has power'

  assert.throws (->new Figure -1),
    /power must be 0-11/

  assert.throws (->new Figure 12),
    /power must be 0-11/

  figure.fight enemy
  assert.ok enemy.dead,
    'can kill'

  assert.throws (-> figure.fight enemy),
    /dead can't fight/

  figure.fight new Figure 11
  assert.ok figure.dead,
    'can be killed'

  assert.throws (-> figure.fight new Figure 0),
    /dead can't fight/

  figure.dead = false
  enemy.dead = false
  enemy.power = 10
  figure.fight enemy
  assert.ok figure.dead == enemy.dead == true,
    'both dies when has same power'

  assert.end()
