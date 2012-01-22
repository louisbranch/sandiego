window.growl = ->
  if $('[data-growl]').length
    elements = $('[data-growl]')
    for i in elements
      text = $(i).html()
      icon = $(i).data('growl')
      textGrowl(i,text,icon)

textGrowl = (e, text, icon) ->
  $(e).meow
    message: text,
    icon: icon

$ cityTimeTravel = ->
  if $('div#time_traveled').length
    $('div#time_traveled').hide()
    window.growl()
    $('div#time_traveled').remove()
