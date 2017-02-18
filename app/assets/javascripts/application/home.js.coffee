setHeight = (identifier, ratio) ->
  $object = $(identifier)
  width = $object.width()
  height = width * ratio
  $object.height(height)

$(document).on 'ready page:load', ->
  packRatio = 66.0/57.0
  setHeight '#packman', packRatio
  $(window).resize ()->
    setHeight '#packman', packRatio
