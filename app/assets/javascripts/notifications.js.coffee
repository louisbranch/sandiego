growl = ->
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
  if $('div#city_time_traveled').length
    $('div#city_time_traveled').hide()
    growl()
    playCityTravelTime()
    $('div#city_time_traveled').remove()

window.locationTimeTravel = ->
  if $('div#location_time_traveled').length
    $('div#location_time_traveled').hide()
    $('div#traits_found').hide()
    growl()
    playLocationTravelTime()
    $('div#location_time_traveled').remove()

playCityTravelTime = ->
  document.getElementById('city_travel_sound').play()

playLocationTravelTime = ->
  document.getElementById('location_travel_sound').play()
