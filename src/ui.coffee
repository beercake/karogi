exports.ui = ->
  Stage (stage) ->
    stage.viewbox 500, 300
    box = Stage.image('box').appendTo stage
    box.pin 'align', 0.5

  Stage
    image: '../assets/tiles/castle.png'
    textures: box:
      x: 0
      y: 0
      width: 64
      height: 64
