test 'tile', (assert) ->
  assert.deepEqual Tile.types, ['Water', 'Grass'],
    'tile types are water and grass'

  assert.throws (-> new Tile),
    /must have a type/

  assert.throws (-> new Tile 'Shit'),
    /tile must be water or grass/

  assert.end()
  
