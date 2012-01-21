window.growl = ->
  if $('[data-growl]').length
    elements = $('[data-growl]')
    for i in elements
      text = $(i).data('growl')
      icon = $(i).data('growl-icon')
      textGrowl(i,text,icon)

textGrowl = (e, text, icon) ->
  $(e).meow
    message: text,
    icon: icon
